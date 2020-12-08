using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class ClsEspecialidad
    {
        ORMDataContext BD = new ORMDataContext();
        
        public Object consultarTodos()
        {
            return from e in BD.especialidad
                   select e;
        }
    }
}
