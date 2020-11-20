using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class ClsEnteSalud
    {
        public string Registrar(ente_salud objEnte)
        {
            ORMDataContext BD = new ORMDataContext();
            try
            {
                BD.ente_salud.InsertOnSubmit(objEnte);
                BD.SubmitChanges();
                return "Registro exitoso";
            }
            catch (Exception ex)
            {
                return "Error registro: " + ex.Message;
            }
        }
    }
}
