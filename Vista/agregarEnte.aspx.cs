using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

namespace Vista
{
    public partial class agregarEnte : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ClsCiudad ciudadDAO = new ClsCiudad();
            DropDownList.DataSource = ciudadDAO.consularTodo();
            DropDownList.DataValueField = "id_Ciudad";
            DropDownList.DataTextField = "ciudad1";
            DropDownList.DataBind();
        }

        protected void btnRegistrarEnte_Click(object sender, EventArgs e)
        {
            string mensaje = string.Empty;
            ClsEnteSalud clsEnte = new ClsEnteSalud();
            ente_salud ente_Salud = new ente_salud();
            ClsPersona clsPersona = new ClsPersona();
            persona persona = new persona();
            //ente_Salud.id_persona = int.Parse(Session["idPersona"].ToString());
            ente_Salud.nit = int.Parse(TextNit.Text);
            ente_Salud.razon_social = TextRazonS.Text;
            ente_Salud.representante = TextRepresentante.Text;
            ente_Salud.correo = TextCorreo.Text;
            ente_Salud.telefono = TextTelefono.Text;
            ente_Salud.sitio_web = textSitioW.Text;
            ente_Salud.id_ciudad = int.Parse(DropDownList.SelectedValue.ToString());
            ente_Salud.capacidad_pacientes = int.Parse(TextCapacidad.Text);
            mensaje = clsEnte.Registrar(ente_Salud);
            Page.RegisterStartupScript("script", "<script languaje=JavaScript>alert('" + mensaje + "');location.href='agregarEnte.aspx';</script>");

        }
    }
}