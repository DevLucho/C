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

        public Object ConsultarCita(int idPersona, string estado)
        {
            ORMDataContext BD = new ORMDataContext();
            return from c in BD.cita
                   where c.estado == estado && c.id_persona == idPersona
                   select new
                   {
                       id_cita = c.id_cita,
                       fecha_cita = c.fecha_cita.ToShortDateString(),
                       id_hora = c.hora_cita.hora,
                       especialista = c.especialista.nombre,
                       especialidad = c.especialista.especialidad.especialidad1,
                       calificacion = "Sin calificar",
                       estado = c.estado
                   };
        }


        public List<cita> citaReservada(DateTime fecha)
        {
            ORMDataContext BD = new ORMDataContext();
            return (from c in BD.cita
                    where c.estado.Equals("Reservada") && c.fecha_cita == fecha
                    select c).ToList();
        }
        public Object consularHora()
        {
            ORMDataContext BD = new ORMDataContext();
            return from h in BD.hora_cita
                   select h;
        }

        public List<hora_cita> consultarHoras()
        {
            ORMDataContext BD = new ORMDataContext();
            return (from h in BD.hora_cita
                    select h).ToList();
        }

        public hora_cita horasConReseva(int id)
        {
            ORMDataContext BD = new ORMDataContext();
            return (from h in BD.hora_cita
                    where h.id_hora == id
                    select h).First();
        }

        public void CalificarCita(int calificacion, cita objCita)
        {
            ORMDataContext BD = new ORMDataContext();
            var citaCalificada = (from c in BD.cita
                                  where c.id_cita == objCita.id_cita
                                  select c).First();
            citaCalificada.calificacion = calificacion;
            citaCalificada.estado = "Atendido";
            BD.SubmitChanges();
        }
    }
}
