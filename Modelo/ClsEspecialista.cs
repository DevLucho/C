using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class ClsEspecialista
    {
        public string Registrar(especialista objEspecilista)
        {
            ORMDataContext BD = new ORMDataContext();
            try
            {
                BD.especialista.InsertOnSubmit(objEspecilista);
                BD.SubmitChanges();
                return "Registro exitoso";
            }
            catch (Exception ex)
            {
                return "Error registro: " + ex.Message;
            }
        }

        public Object ConsultarEspecialista(string especialidad, string ciudad)
        {
            ORMDataContext BD = new ORMDataContext();
            return from e in BD.VistaEspecialista
                   where e.especialidad == especialidad && e.ciudad == ciudad
                   select e;
        }
    }
}
