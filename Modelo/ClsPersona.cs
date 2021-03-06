﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class ClsPersona
    {
        public string Registrar(persona objPersona)
        {
            ORMDataContext BD = new ORMDataContext();
            try
            {
                BD.persona.InsertOnSubmit(objPersona);
                BD.SubmitChanges();
                return "Registro exitoso";
            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message;
            }
        }

        public persona Login(int cedula, string contrasenia)
        {
            ORMDataContext BD = new ORMDataContext();
            var personaLogin = BD.sp_login(cedula, contrasenia);
            persona objPersona = new persona();

            foreach (var item in personaLogin)
            {
                objPersona.id_persona = item.id_persona;
                objPersona.id_rol = item.id_rol;
                objPersona.cedula = item.cedula;
                objPersona.nombre = item.nombre;
                objPersona.apellido = item.apellido;
                objPersona.correo = item.correo;
                objPersona.celular = item.celular;
            }

            return objPersona;
        }
        
        public Object PersonaContenido()
        {
            ORMDataContext BD = new ORMDataContext();
            return (from e in BD.persona
                    where e.id_rol == 2
                    select new
                    {
                        id_persona = e.id_persona,
                        datos = e.cedula + " - " + e.nombre + " " + e.apellido
                    }).ToList();
        }
        /*
        public List<persona> PersonaContenido()
        {
            ORMDataContext BD = new ORMDataContext();
            return (from e in BD.persona
                    where e.id_rol == 2
                    select e).ToList();
        }*/
    }
}
