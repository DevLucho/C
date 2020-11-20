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

        public Object ConsultarEnfermedad(string enfermedad, string sintoma)
        {
            ORMDataContext BD = new ORMDataContext();
            return from e in BD.VistaEnfermedad
                   where e.nombre == enfermedad || e.sintoma == sintoma
                   select e;
        }

    }
}
