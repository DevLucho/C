using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
namespace Vista
{
    public partial class especialidades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClsEspecialista clsEspecialista = new ClsEspecialista();
                gdgGrid.DataSource = clsEspecialista.consultarEspecialistas();
                gdgGrid.DataBind();
                gdgGrid.HeaderRow.TableSection = TableRowSection.TableHeader; // Agrega etiqueta: <thead> a la tabla
            }
        }

        protected void gdgGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow filaSeleccionada = (GridViewRow)((Control)e.CommandSource).NamingContainer;
            int rowIndex = filaSeleccionada.RowIndex;
            if (e.CommandName == "Seleccionar")
            {
                Session["idEspecialista"] = gdgGrid.Rows[rowIndex].Cells[0].Text;
                Session["nombreEspecialista"] = gdgGrid.Rows[rowIndex].Cells[1].Text;
                Server.Transfer("crearCita.aspx");
            }
        }
    }
}