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
			persona persona = new persona();
			persona = clsPersona.Login(int.Parse(TextCedula.Text), TextPassword.Text);
            if (persona.cedula  != 0)
            {
                Session["idPersona"] = persona.id_persona;
                Session["nombre"] = persona.nombre;
                Session["apellido"] = persona.apellido;
                if (persona.id_rol == 1)
                {
                    Response.Redirect("agregarPersona.aspx",false);
                }
                else if (persona.id_rol ==2)
                {
                    Response.Redirect("laOtra.aspx", false);
                }
                else if (persona.id_rol == 3)
                {
                    Response.Redirect("estarosa.aspx", false);
                }
            }
            else
            {
                Page.RegisterStartupScript("script","<script languaje=JavaScript>alert('Datos Incorrectos')</script>");
            }
        }
    }
}