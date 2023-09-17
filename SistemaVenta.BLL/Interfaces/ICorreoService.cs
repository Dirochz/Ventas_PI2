using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaVenta.BLL.Interfaces
{
    public interface ICorreoService
    {
        Task<bool> EnviarCorreo(string CorreoDestino, string Asunto, string Mensaje);

    }
}
