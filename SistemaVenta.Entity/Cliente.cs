using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaVenta.Entity
{
    public partial class Cliente
    {

        public int ClienteId { get; set; }
        public string Nombre { get; set; }
        public string Domicilio { get; set; }
        public string RFC { get; set; }
        public DateTime FechaExpedicion { get; set; }

    }
}
