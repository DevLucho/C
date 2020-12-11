using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
namespace Vista
{
    public partial class agregarEspecialista1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClsCiudad ciudadDAO = new ClsCiudad();
                drpCiudad.DataSource = ciudadDAO.consularTodo();
                drpCiudad.DataValueField = "id_ciudad";
                drpCiudad.DataTextField = "ciudad1";
                drpCiudad.DataBind();

                ClsEspecialidad especialidadDAO = new ClsEspecialidad();
                drpEspecialidad.DataSource = especialidadDAO.consultarTodos();
                drpEspecialidad.DataValueField = "id_especialidad";
                drpEspecialidad.DataTextField = "especialidad1";
                drpEspecialidad.DataBind();

                if (int.Parse(Session["idRol"].ToString()) == 2)
                {
                    ClsEnteSalud ente = new ClsEnteSalud();
                    ddlEnte.DataSource = ente.EnteAsociado(int.Parse(Session["idPersona"].ToString()));
                    ddlEnte.DataValueField = "id_ente";
                    ddlEnte.DataTextField = "datos";
                    ddlEnte.DataBind();
                }
            }

        }

        protected void btnRegistarEspecialista_Click(object sender, EventArgs e)
        {
            string mensaje = string.Empty;
            ClsEspecialista especialistaDAO = new ClsEspecialista();
            especialista especialista = new especialista();
            if (int.Parse(Session["idRol"].ToString()) == 2)
            {
                especialista.id_ente = int.Parse(ddlEnte.SelectedValue.ToString());
            }
            especialista.nombre = TextNombre.Text;
            especialista.correo = TextCorreo.Text;
            especialista.celular = TextCelular.Text;
            especialista.id_especialidad = int.Parse(drpEspecialidad.SelectedValue.ToString());
            especialista.id_ciudad = int.Parse(drpCiudad.SelectedValue.ToString());
            especialista.num_licencia = int.Parse(TextNumLicencia.Text);
            especialista.fech_expedicion_licen = DateTime.Parse(TextFechaE.Text);
            mensaje = especialistaDAO.Registrar(especialista);
            Page.RegisterStartupScript("script", "<script languaje=JavaScript>alert('" + mensaje + "');location.href='agregarEspecialista.aspx';</script>");
        }
    }
}
