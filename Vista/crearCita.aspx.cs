using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

namespace Vista
{
    public partial class crearCita1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblBienvenido.Text = "Especialista:  " + Session["nombreEspecialista"];

                ClsCita clsCita = new ClsCita();
                DropDownList.DataSource = clsCita.consularHora();
                DropDownList.DataValueField = "id_hora";
                DropDownList.DataTextField = "hora";
                DropDownList.DataBind();
            }

        }

        protected void btnRegistrarCita_Click(object sender, EventArgs e)
        {
            string mensaje = string.Empty;
            ClsCita clsCita = new ClsCita();
            cita cita = new cita();
            cita.fecha_cita = DateTime.Parse(TextFecha.Text);
            cita.id_hora = int.Parse(DropDownList.SelectedValue.ToString());
            cita.id_persona = int.Parse(Session["idPersona"].ToString());
            cita.id_especialista = int.Parse(Session["idEspecialista"].ToString());
            cita.estado = "Registrado";
            mensaje = clsCita.Registrar(cita);
            Page.RegisterStartupScript("script", "<script languaje=JavaScript>alert('" + mensaje + "');location.href='dashPersona.aspx';</script>");

        }
    }
}