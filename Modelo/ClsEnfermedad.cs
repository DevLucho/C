using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class ClsEnfermedad
    {
        public Object ConsultarTodos()
        {
            ORMDataContext BD = new ORMDataContext();
            return from e in BD.enfermedad
                   select e;
        }

        public Object ConsultarTodosSintomas()
        {
            ORMDataContext BD = new ORMDataContext();
            return from s in BD.sintoma
                   select s;
        }

        static public List<sintoma_enfermedad> ConsultarSintomas(int id)
        {
            ORMDataContext BD = new ORMDataContext();
            return (from e in BD.sintoma_enfermedad
                   where e.id_enfermedad == id
                   select e).ToList(); 
        }

        static public List<enfermedad> ConsultarEnfermedad(int id)
        {
            ORMDataContext BD = new ORMDataContext();
            return (from e in BD.enfermedad
                   where e.id_enfermedad == id
                   select e).ToList();
        }

    }
}
