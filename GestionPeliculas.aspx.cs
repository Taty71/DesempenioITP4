using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebParcial
{
    public partial class GestionPeliculas : System.Web.UI.Page
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
             
                string nombrePelicula = Server.HtmlEncode(TextBox1.Text);
                int idDirector;

                if (string.IsNullOrEmpty(nombrePelicula))
                {
                    Label3.Text = "El campo Nombre de la Película es obligatorio.";
                    Label3.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                if (!int.TryParse(DropDownList1.SelectedValue, out idDirector) || idDirector == 0)
                {
                    Label3.Text = "Debes seleccionar un Director.";
                    Label3.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                SqlDataSource3.InsertParameters["nombrePelicula"].DefaultValue = nombrePelicula;
                SqlDataSource3.InsertParameters["idDirector"].DefaultValue = idDirector.ToString();

                SqlDataSource3.Insert();
                GridView1.DataBind();
                Label3.Text = "Película agregada correctamente.";
                Label3.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                Label3.Text = "Error al insertar la película: " + ex.Message;
                Label3.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue != "0")
            {
                int directorId = int.Parse(DropDownList1.SelectedValue);

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conectando"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT apellido FROM Directores WHERE id = @id", conn))
                    {
                        cmd.Parameters.AddWithValue("@id", directorId);
                        conn.Open();
                        string apellido = cmd.ExecuteScalar() as string;
                        TextBox2.Text = apellido;
                    }
                }
            }
            else
            {
                TextBox2.Text = "";
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox1.Text = GridView1.SelectedRow.Cells[1].Text;
            string value = Server.HtmlEncode(Request.Form["TextBox1"]);
            string nombreDirector = GridView1.SelectedRow.Cells[2].Text;
            string apellidoDirector = GridView1.SelectedRow.Cells[3].Text;
            string directorCompleto = nombreDirector + " " + apellidoDirector;

            ListItem item = DropDownList1.Items.FindByText(directorCompleto);
            if (item != null)
            {
                DropDownList1.SelectedValue = item.Value;
            }
            else
            {
                DropDownList1.ClearSelection();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (HiddenFieldDelete.Value == "Yes")
            {
                try
                {
                    SqlDataSource3.DeleteParameters["id"].DefaultValue = GridView1.DataKeys[e.RowIndex].Value.ToString();
                    SqlDataSource3.Delete();
                    Label3.Text = "Registro eliminado correctamente.";
                    Label3.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex)
                {
                    Label3.Text = "Error al eliminar el registro: " + ex.Message;
                    Label3.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                e.Cancel = true;
            }
        }
    }
}
