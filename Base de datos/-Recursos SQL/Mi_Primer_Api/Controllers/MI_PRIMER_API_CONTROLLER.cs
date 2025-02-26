using Microsoft.AspNetCore.Mvc;

namespace Mi_Primer_Api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class MI_PRIMER_API_CONTROLLER : ControllerBase
    {

        private readonly ILogger<MI_PRIMER_API_CONTROLLER> _logger;

        public MI_PRIMER_API_CONTROLLER(ILogger<MI_PRIMER_API_CONTROLLER> logger)
        {
            _logger = logger;
        }

        [HttpGet("MI PRIMER API HOLA MUNDO")]
        public ActionResult MostrarSaludo()
        {
            return Ok("hola mundo ");
        }
    }
}
