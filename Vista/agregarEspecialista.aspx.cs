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
            lblBienvenido.Text = "Bienvenido " + Session["nombre"] + " " + Session["apellido"];
            ClsCiudad ciudadDAO = new ClsCiudad();
            drpCiudad.DataSource = ciudadDAO.consularTodo();
            drpCiudad.DataValueField = "id_Ciudad";
            drpCiudad.DataTextField = "ciudad1";
            drpCiudad.DataBind();

            ClsEspecialidad especialidadDAO = new ClsEspecialidad();
            drpEspecialidad.DataSource = especialidadDAO.consultarTodos();
            drpEspecialidad.DataValueField = "id_especialidad";
            drpEspecialidad.DataTextField = "especialidad1";
            drpEspecialidad.DataBind();
        }

        protected void btnRegistarEspecialista_Click(object sender, EventArgs e)
        {
            string mensaje = string.Empty;
            ClsEspecialista especialistaDAO = new ClsEspecialista();
            especialista especialista = new especialista();
            especialista.id_ente = especialistaDAO.idPersonaEnte(int.Parse(Session["idPersona"].ToString()));
            especialista.nombre = TextNombre.Text;
            especialista.correo = TextCorreo.Text;
            especialista.celular = TextCelular.Text;
            especialista.id_especialidad = int.Parse(drpEspecialidad.SelectedValue.ToString());
            especialista.id_ciudad = int.Parse(drpCiudad.SelectedValue.ToString());
            especialista.num_licencia = int.Parse(TextNumLicencia.Text);
            especialista.fech_expedicion_licen = DateTime.Parse(TextFechaE.Text);
            especialistaDAO.Registrar(especialista);
        }
    }
}
