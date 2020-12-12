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
                       nombre = c.persona.nombre,
                       fecha_cita = c.fecha_cita.ToShortDateString(),
                       id_hora = c.hora_cita.hora,
                       especialista = c.especialista.nombre,
                       especialidad = c.especialista.especialidad.especialidad1,
                       calificacion = "Sin calificar",
                       estado = c.estado
                   };
        }

        public Object AllConsulCita()
        {
            ORMDataContext BD = new ORMDataContext();
            return from c in BD.cita
                   select new
                   {
                       id_cita = c.id_cita,
                       nombre = c.persona.nombre + " " + c.persona.apellido,
                       fecha_cita = c.fecha_cita.ToShortDateString(),
                       id_hora = c.hora_cita.hora,
                       especialista = c.especialista.nombre,
                       especialidad = c.especialista.especialidad.especialidad1,
                       calificacion = c.calificacion,
                       estado = c.estado
                   };
        }

        public Object AllFindConsulCita(int id)
        {
            ORMDataContext BD = new ORMDataContext();
            return from c in BD.cita where c.id_persona == id
                   select new
                   {
                       id_cita = c.id_cita,
                       fecha_cita = c.fecha_cita.ToShortDateString(),
                       id_hora = c.hora_cita.hora,
                       especialista = c.especialista.nombre,
                       especialidad = c.especialista.especialidad.especialidad1,
                       calificacion = c.calificacion,
                       estado = c.estado
                   };
        }


        public List<cita> citaReservada(DateTime fecha)
        {
            ORMDataContext BD = new ORMDataContext();
            return (from c in BD.cita
                    where (c.estado.Equals("Reservada") || c.estado.Equals("Atendido")) && c.fecha_cita == fecha
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

        public void CalificarCita(int calificacion, int id)
        {
            ORMDataContext BD = new ORMDataContext();
            var citaCalificada = (from c in BD.cita
                                  where c.id_cita == id
                                  select c).First();
            citaCalificada.calificacion = calificacion;
            citaCalificada.estado = "Atendido";
            BD.SubmitChanges();
        }

        static public int CountCita()
        {
            ORMDataContext BD = new ORMDataContext();
            return (from e in BD.cita where e.estado.Equals("Atendido") select e).Count();
        }

        static public int CountCitaSinCal(int id)
        {
            ORMDataContext BD = new ORMDataContext();
            return (from e in BD.cita where e.id_persona == id && e.calificacion == null select e).Count();
        }
    }
}
