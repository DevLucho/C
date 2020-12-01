using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class ClsCita
    {
        public string Registrar(cita objCita)
        {
            ORMDataContext BD = new ORMDataContext();
            try
            {
                BD.cita.InsertOnSubmit(objCita);
                BD.SubmitChanges();
                return "Registro exitoso";
            }
            catch (Exception ex)
            {
                return "Error registro: " + ex.Message;
            }
        }

        public Object ConsultarCita(string estado)
        {
            ORMDataContext BD = new ORMDataContext();
            return from c in BD.cita
                   where c.estado == estado
                   select c;
        }

        public Object consularHora()
        {
            ORMDataContext BD = new ORMDataContext();
            return from h in BD.hora_cita
                   select h;
        }

        public void CalificarCita(int calificacion, cita objCita)
        {
            ORMDataContext BD = new ORMDataContext();
            var citaCalificada = (from c in BD.cita
                                  where c.id_cita == objCita.id_cita
                                  select c).First();
            citaCalificada.calificacion = calificacion;
            BD.SubmitChanges();
        }
    }
}
