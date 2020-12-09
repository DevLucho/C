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

        public Object consultarEspecialistas()
        {
            ORMDataContext BD = new ORMDataContext();
            return from e in BD.especialista
                   select new
                   {
                       id = e.id_especialista,
                       nombre = e.nombre,
                       ente = e.ente_salud.razon_social,
                       correo = e.correo,
                       celular = e.celular,
                       especialidad = e.especialidad.especialidad1,
                       ciudad = e.ciudad.ciudad1
                       /*
                       licencia = e.num_licencia,
                       expedicion = e.fech_expedicion_licen.ToShortDateString()
                       */
                   };
        }

        static public List<especialista> consultarEspecialistass(int id)
        {
            ORMDataContext BD = new ORMDataContext();
            return (from e in BD.especialista where e.id_especialista == id select e).ToList();
        }

        public int idPersonaEnte(int idPersona)
        {
            ORMDataContext BD = new ORMDataContext();
            var consultaidEnte = (from e in BD.ente_salud
                                  where e.id_persona == idPersona
                                  select new
                                  {
                                      idEnte = e.id_ente
                                  }).First();
            return consultaidEnte.idEnte;
        }
    }
}
