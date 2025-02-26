
namespace Farmacia_Nueva_Api.Modelos.tbCatEstadoEmpresa
{

    public class tbCatEstadoEmpresa 
    {

        public int idEstadoEmpresa { get; set; }
        public int nombreestado { get; set; }
        public int descripiconEstado { get; set; }
        public int usuarioCreacion { get; set; }
        public int fechaCreacion { get; set; }
        public int usuairoModificacion { get; set; }
        public int fechaModificacion  { get; set; }
        public int observaciones { get; set; }

        public class listarCatEstadoEmpresa
        {
            public int idEstadoEmpresa { get; set; }
            public int nombreestado { get; set; }
            public int descripiconEstado { get; set; }
            public int usuarioCreacion { get; set; }
            public int fechaCreacion { get; set; }
            public int usuairoModificacion { get; set; }
            public int fechaModificacion { get; set; }
            public int observaciones { get; set; }

        }



    }

    
}
