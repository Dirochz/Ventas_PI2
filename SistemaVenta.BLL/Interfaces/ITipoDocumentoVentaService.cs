using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using SistemaVenta.Entity;

namespace SistemaVenta.BLL.Interfaces
{
    public interface ITipoDocumentoVentaService
    {

        Task<List<TipoDocumentoVenta>> Lista();
    }
}
