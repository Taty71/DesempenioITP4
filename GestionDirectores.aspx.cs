using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebParcial
{
    public partial class GestionDirectores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                
                string apellido = Server.HtmlEncode(TextBox1.Text);
                string nombre = Server.HtmlEncode(TextBox2.Text);

                if (string.IsNullOrEmpty(apellido))
                {
                    Label2.Text = "El campo Apellido es obligatorio.";
                    Label2.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                if (string.IsNullOrEmpty(nombre))
                {
                    Label2.Text = "El campo Nombre es obligatorio.";
                    Label2.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                SqlDataSource1.InsertParameters["apellido"].DefaultValue = apellido;
                SqlDataSource1.InsertParameters["nombre"].DefaultValue = nombre;

                SqlDataSource1.Insert();
                GridView1.DataBind();
                Label2.Text = "Director agregado correctamente.";
                Label2.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                Label2.Text = "Error al insertar el director: " + ex.Message;
                Label2.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (eliminar.Value == "Yes")
            {
                try
                {
                    SqlDataSource1.DeleteParameters["id"].DefaultValue = GridView1.DataKeys[e.RowIndex].Value.ToString();
                    SqlDataSource1.Delete();
                    GridView1.DataBind();
                    Label2.Text = "Director eliminado correctamente.";
                    Label2.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex)
                {
                    Label2.Text = "Error al eliminar el director: " + ex.Message;
                    Label2.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                e.Cancel = true;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            int selectedRowIndex = GridView1.SelectedIndex;
            GridViewRow row = GridView1.SelectedRow;
            string apellido = row.Cells[1].Text; 
            string nombre = row.Cells[2].Text;   
           
            TextBox1.Text = apellido;
            TextBox2.Text = nombre;
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            string id = GridView1.DataKeys[e.RowIndex].Values[0].ToString();
            string apellido = ((TextBox)row.Cells[1].Controls[0]).Text;
            string nombre = ((TextBox)row.Cells[2].Controls[0]).Text;

            SqlDataSource1.UpdateParameters["id"].DefaultValue = id;
            SqlDataSource1.UpdateParameters["apellido"].DefaultValue = apellido;
            SqlDataSource1.UpdateParameters["nombre"].DefaultValue = nombre;

            SqlDataSource1.Update();
            GridView1.EditIndex = -1;
            GridView1.DataBind();
            
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }
    }
    
}
