using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using static Farmacia_Nueva_Api.Modelos.tbCatEstadoEmpresa.tbCatEstadoEmpresa;

namespace Farmacia_Nueva_Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class tbCatEstadoEmpresaController : ControllerBase
    {
        public readonly string con;

        public tbCatEstadoEmpresaController(IConfiguration configuration)
        {
            con = configuration.GetConnectionString("conexion");
        }

        [HttpGet]
        public IEnumerable<listarCatEstadoEmpresa> obtenerEstadoEmpresa()
        {
            List<listarCatEstadoEmpresa> tbEstadoEmpresa = new List<listarCatEstadoEmpresa>();

            using (SqlConnection connection = new SqlConnection(con))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand("SP_TB_CAT_ESTADO_EMPRESA_LR", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            listarCatEstadoEmpresa empresa = new listarCatEstadoEmpresa
                            {
                                // Asigna aquí los valores del reader a las propiedades de tu modelo
                                // Por ejemplo:
                                // Propiedad1 = reader["NombreColumna"].ToString(),
                                // Propiedad2 = (int)reader["OtraColumna"],
                            };

                            tbEstadoEmpresa.Add(empresa);
                        }
                    }
                }
            }

            return tbEstadoEmpresa;
        }
    }
}
