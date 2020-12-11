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
            if (int.Parse(Session["idRol"].ToString()) == 1)
            {
                lblCita.Text = ClsCita.CountCita().ToString();
                lblEnte.Text = ClsEnteSalud.CountEste().ToString();
            }
            if (int.Parse(Session["idRol"].ToString()) == 2)
                lblEnte.Text = ClsEnteSalud.CountEsteAsociado(int.Parse(Session["idPersona"].ToString())).ToString();
            if (int.Parse(Session["idRol"].ToString()) == 3)
                lblCita.Text = ClsCita.CountCitaSinCal(int.Parse(Session["idPersona"].ToString())).ToString();



            if (!IsPostBack)
            {
                ClsEnteSalud enteSalud = new ClsEnteSalud();
                if (int.Parse(Session["idRol"].ToString()) == 1)
                {
                    gdgGrid.DataSource = enteSalud.ConsultarEnte();
                    gdgGrid.DataBind();
                    if (gdgGrid.Rows.Count != 0)
                        gdgGrid.HeaderRow.TableSection = TableRowSection.TableHeader; // Agrega etiqueta: <thead> a la tabla
                }
                else if (int.Parse(Session["idRol"].ToString()) == 2)
                {
                    gdvEnte.DataSource = enteSalud.ConsultarEnteAsociado(int.Parse(Session["idPersona"].ToString()));
                    gdvEnte.DataBind();
                    if (gdvEnte.Rows.Count != 0)
                        gdvEnte.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
                else
                {
                    ClsCita cita = new ClsCita();
                    gdvCita.DataSource = cita.AllFindConsulCita(int.Parse(Session["idPersona"].ToString()));
                    gdvCita.DataBind();
                    if (gdvCita.Rows.Count != 0)
                        gdvCita.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
        }

        public List<ente_salud> ConsultarEnte()
        {
            return ClsEnteSalud.consultarEnte();
        }

        protected void gdgGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (!IsPostBack)
            {
                ClsPersona persona = new ClsPersona();
                if (e.Row.RowType == DataControlRowType.DataRow && e.Row.DataItem != null)
                {
                    DropDownList ddlList = new DropDownList();
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
                DropDownList ddlList = (DropDownList)filaSeleccionada.FindControl("ddlUsuario");
                int id = int.Parse(ddlList.SelectedValue.ToString());
                int id_ente = int.Parse(gdgGrid.Rows[rowIndex].Cells[0].Text);
                ClsEnteSalud ente = new ClsEnteSalud();
                ente.AsignarPersona(id, id_ente);
                Page.RegisterStartupScript("script", "<script languaje=JavaScript>alert('Asignación exitosa.');location.href='dashboard.aspx';</script>");
            }
        }

    }
}