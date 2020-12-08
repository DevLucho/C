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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClsEnfermedad clsEnfermedad = new ClsEnfermedad();
                DropDownEnfermedad.DataSource = clsEnfermedad.ConsultarTodos();
                DropDownEnfermedad.DataValueField = "id_enfermedad";
                DropDownEnfermedad.DataTextField = "nombre";
                DropDownEnfermedad.DataBind();

                DropDownSintoma.DataSource = clsEnfermedad.ConsultarTodosSintomas();
                DropDownSintoma.DataValueField = "id_sintoma";
                DropDownSintoma.DataTextField = "sintoma1";
                DropDownSintoma.DataBind();
            }
        }

        protected void btnConsultarSintoma_Click(object sender, EventArgs e)
        {
            ClsEnfermedad clsEnfermedad = new ClsEnfermedad();
            enfermedad enfermedad = new enfermedad();
            gdgGrid.DataSource = clsEnfermedad.ConsultarEnfermedad(DropDownEnfermedad.SelectedItem.Text, DropDownSintoma.SelectedItem.Text);
            gdgGrid.DataBind();
        }
    }
}