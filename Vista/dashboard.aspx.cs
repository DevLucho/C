using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

namespace Vista
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblEspe.Text = ClsEspecialista.CountEspecialistas().ToString();
            lblCita.Text = ClsCita.CountCita().ToString();
            lblEnte.Text = ClsEnteSalud.CountEste().ToString();
            if (!IsPostBack)
            {
                ClsEnteSalud enteSalud = new ClsEnteSalud();
                gdgGrid.DataSource = enteSalud.ConsultarEnte();
                gdgGrid.DataBind();
                gdgGrid.HeaderRow.TableSection = TableRowSection.TableHeader; // Agrega etiqueta: <thead> a la tabla
            }
        }

        public List<ente_salud> ConsultarEnte()
        {
            return ClsEnteSalud.consultarEnte();
        }

        DropDownList ddlList = new DropDownList();

        protected void gdgGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (!IsPostBack)
            {
                ClsPersona persona = new ClsPersona();
                if (e.Row.RowType == DataControlRowType.DataRow && e.Row.DataItem != null)
                {
                    ddlList = (DropDownList)e.Row.FindControl("ddlUsuario");
                    ddlList.DataSource = persona.PersonaContenido();
                    ddlList.DataTextField = "datos";
                    ddlList.DataValueField = "id_persona";
                    ddlList.DataBind();
                }
            }
        }

        protected void gdgGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow filaSeleccionada = (GridViewRow)((Control)e.CommandSource).NamingContainer;
            int rowIndex = filaSeleccionada.RowIndex;
            if (e.CommandName == "Asignar")
            {
                int id_persona = 3;
                int id_ente = int.Parse(gdgGrid.Rows[rowIndex].Cells[0].Text);
                ClsEnteSalud ente = new ClsEnteSalud();
                ente.AsignarPersona(id_persona, id_ente);
                Page.RegisterStartupScript("script", "<script languaje=JavaScript>alert('Asignación exitosa');location.href='dashboard.aspx';</script>");
            }
        }
    }
}