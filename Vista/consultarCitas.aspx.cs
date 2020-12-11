using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

namespace Vista
{
    public partial class consultarCitas1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClsCita clsCita = new ClsCita();
                if (int.Parse(Session["idRol"].ToString()) == 3)
                {
                    gdgGrid.DataSource = clsCita.ConsultarCita(int.Parse(Session["idPersona"].ToString()), "Reservada");
                }
                else
                {
                    gdgGrid.DataSource = clsCita.AllConsulCita();
                }
                gdgGrid.DataBind();
                if (gdgGrid.Rows.Count != 0)
                    gdgGrid.HeaderRow.TableSection = TableRowSection.TableHeader; // Agrega etiqueta: <thead> a la tabla
            }

        }

        protected void gdgGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow filaSeleccionada = (GridViewRow)((Control)e.CommandSource).NamingContainer;
            int rowIndex = filaSeleccionada.RowIndex;
            if (e.CommandName == "Calificar")
            {
                DropDownList ddlList = (DropDownList)filaSeleccionada.FindControl("ddlCalificar");
                int calificacion = int.Parse(ddlList.SelectedValue.ToString());
                int id_cita = int.Parse(gdgGrid.Rows[rowIndex].Cells[0].Text);
                ClsCita clsCita = new ClsCita();
                clsCita.CalificarCita(calificacion, id_cita);
                Page.RegisterStartupScript("script", "<script languaje=JavaScript>alert('Calificación exitosa.');location.href='dashboard.aspx';</script>");
            }

        }

        protected void gdgGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (int.Parse(Session["idRol"].ToString()) != 3)
            {
                if (e.Row.RowType == DataControlRowType.Header)
                {
                    e.Row.Cells[7].Visible = false;
                    e.Row.Cells[8].Visible = false;
                }
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    e.Row.Cells[7].Visible = false;
                    e.Row.Cells[8].Visible = false;
                }
            }
            else
            {
                if (!IsPostBack)
                {
                    if (e.Row.RowType == DataControlRowType.DataRow && e.Row.DataItem != null)
                    {
                        DropDownList ddlList = new DropDownList();
                        ddlList = (DropDownList)e.Row.FindControl("ddlCalificar");
                        ListItem i;
                        i = new ListItem("★", "1");
                        ddlList.Items.Add(i);
                        i = new ListItem("★★", "2");
                        ddlList.Items.Add(i);
                        i = new ListItem("★★★", "3");
                        ddlList.Items.Add(i);
                        i = new ListItem("★★★★", "4");
                        ddlList.Items.Add(i);
                        i = new ListItem("★★★★★", "5");
                        ddlList.Items.Add(i);
                    }
                }
            }
        }


        protected void gdgGrid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}