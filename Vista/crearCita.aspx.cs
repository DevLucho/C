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
            reserva.Visible = false;
        }

        public List<especialista> infoEspecialista()
        {
            return ClsEspecialista.consultarEspecialistass(int.Parse(Session["idEspecialista"].ToString()));
        }

        protected void btnRegistrarCita_Click(object sender, EventArgs e)
        {
            string mensaje = string.Empty;
            ClsCita clsCita = new ClsCita();
            cita cita = new cita();
            cita.fecha_cita = Calendar.SelectedDate;
            cita.id_hora = int.Parse(DropDownList.SelectedValue.ToString());
            cita.id_persona = int.Parse(Session["idPersona"].ToString());
            cita.id_especialista = int.Parse(Session["idEspecialista"].ToString());
            cita.estado = "Reservada";
            mensaje = clsCita.Registrar(cita);
            Page.RegisterStartupScript("script", "<script languaje=JavaScript>alert('" + mensaje + "');location.href='dashboard.aspx';</script>");
        }

        protected void Calendar_SelectionChanged(object sender, EventArgs e)
        {
            txtFecha.Text = "Fecha seleccionada: " + Calendar.SelectedDate.ToShortDateString();
        }

        protected void Calendar_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
                e.Day.IsSelectable = false;
            }
        }

        protected void bntFiltrar_Click(object sender, EventArgs e)
        {
            List<cita> reservado = new List<cita>();
            ClsCita cita = new ClsCita();
            reservado = cita.citaReservada(Calendar.SelectedDate);

            ClsCita clsCita = new ClsCita();
            List<hora_cita> horas = new List<hora_cita>();
            horas = clsCita.consultarHoras();

            // Elimina horas reservadas
            foreach (cita r in reservado)
            {
                hora_cita horas2 = cita.horasConReseva(r.id_hora);
                horas.RemoveAt(horas2.id_hora-1);
            }

            DropDownList.DataSource = horas;
            DropDownList.DataValueField = "id_hora";
            DropDownList.DataTextField = "hora";
            DropDownList.DataBind();

            reserva.Visible = true;
        }

        protected void DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}