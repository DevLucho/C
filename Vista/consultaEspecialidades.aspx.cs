using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
namespace Vista
{
    public partial class consultaEspecialidades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ClsEspecialista clsEspecialista = new ClsEspecialista();
            gdgGrid.DataSource=clsEspecialista.ConsultarEspecialista(TextEspecialidad.Text,TextCiudad.Text);
            gdgGrid.DataBind();
        }
    }
}