using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

namespace Vista
{
	public partial class Login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            ClsPersona clsPersona = new ClsPersona();
            ClsRol clsRol = new ClsRol();
			persona persona = new persona();
			persona = clsPersona.Login(int.Parse(TextCedula.Text), TextPassword.Text);
            if (persona.cedula  != 0)
            {
                Session["idPersona"] = persona.id_persona;
                Session["nombre"] = persona.nombre;
                Session["apellido"] = persona.apellido;
                Session["idRol"] = persona.id_rol;
                Session["rol"] = clsRol.Rol(persona.id_rol);
                /*
                if (persona.id_rol == 1)
                {
                    Response.Redirect("dashAdmin.aspx",false);
                }
                else if (persona.id_rol ==2)
                {
                    Response.Redirect("dashContenido.aspx", false);
                }
                else if (persona.id_rol == 3)
                {
                    Response.Redirect("dashPersona.aspx", false);
                }*/
                Server.Transfer("dashboard.aspx");
            }
            else
            {
                Page.RegisterStartupScript("script","<script languaje=JavaScript>alert('Datos Incorrectos')</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Button2.CausesValidation = false;
            Server.Transfer("agregarPersona.aspx");
        }
    }
}