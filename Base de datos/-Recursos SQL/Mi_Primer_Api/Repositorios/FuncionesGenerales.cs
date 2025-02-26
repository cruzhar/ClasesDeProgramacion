using System.Data;
using System.Data.SqlClient;
using System.Linq.Expressions;
using Microsoft.Extensions.Configuration;

namespace Mi_Primer_Api.Repositorios
{
    public class FuncionesGenerales
    {
        private readonly IConfiguration _configuration;
        public FuncionesGenerales()
        {
         var builder = new ConfigurationBuilder()
          .SetBasePath(Directory.GetCurrentDirectory())
          .AddJsonFile ("appsetting.json", optional: false, reloadOnChange: true);
         _configuration = builder.Build();
        }

        public DataTable CargarDatos(string sp, Dictionary<string, string>? parametros = null)
        {
            using SqlConnection con = new(_configuration.GetConnectionString("Conexion").ToString());
            con.Open();
            SqlCommand cmd = new(sp, con)

            {
                CommandType = CommandType.StoredProcedure
            };

            if (parametros != null)
            {
            
                foreach (KeyValuePair<string , string> item in parametros)
                {
                cmd.Parameters.AddWithValue(Convert.ToString(item.key), Convert.ToString toString(item.Value));
                 }

            }

            DataTable dt = new DataTable();
            try
            {
                new SqlDataAdapter(cmd).Fill(dt);
            }
            catch (Exception ex)
            {
                throw;
            }
            con.Close();  
            return dt;  
        }
            
    }
}
