using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
namespace Vista
{
    public partial class agregarPersona : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblBienvenido.Text = "Bienvenido " + Session["nombre"] +" "+ Session["apellido"];

        }

        protected void btnRegistra_Click(object sender, EventArgs e)
        {
            string mensaje = string.Empty;
            ClsPersona clsPersona = new ClsPersona();
            persona persona = new persona();
            persona.nombre = TextNombre.Text;
            persona.apellido = TextApellido.Text;
            persona.correo = TextCorreo.Text;
            persona.celular = (TextCelular.Text);
            persona.cedula = int.Parse(TextCedula.Text);
            persona.password = textPassword.Text;
            persona.id_rol = 3;
            mensaje= clsPersona.Registrar(persona);
            Page.RegisterStartupScript("script", "<script languaje=JavaScript>alert('"+mensaje+"')</script>");

        }
    }
}