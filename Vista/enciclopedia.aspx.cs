using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

namespace Vista
{
    public partial class enciclopedia1 : System.Web.UI.Page
    {

        protected List<enfermedad> enfermedad;
        protected List<sintoma_enfermedad> sintomas;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlDatos.Visible = false;
                ClsEnfermedad clsEnfermedad = new ClsEnfermedad();
                ddlEnfermedad.DataSource = clsEnfermedad.ConsultarTodos();
                ddlEnfermedad.DataValueField = "id_enfermedad";
                ddlEnfermedad.DataTextField = "nombre";
                ddlEnfermedad.DataBind();
            }
        }

        protected void btnConsultarSintoma_Click(object sender, EventArgs e)
        {
            enfermedad = ClsEnfermedad.ConsultarEnfermedad(int.Parse(ddlEnfermedad.SelectedValue.ToString()));
            sintomas = ClsEnfermedad.ConsultarSintomas(int.Parse(ddlEnfermedad.SelectedValue.ToString()));
            pnlDatos.Visible = true;
        }
    }
}