using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class ClsCiudad
    {
        public Object consularTodo()
        {
            ORMDataContext BD = new ORMDataContext();
            return from c in BD.ciudad
                   select c;
        }

    }
}
