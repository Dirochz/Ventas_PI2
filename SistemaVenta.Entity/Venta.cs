using System;
using System.Collections.Generic;
using System.Xml.Serialization;

namespace SistemaVenta.Entity
{
    public partial class Venta
    {
        public Venta()
        {
            DetalleVenta = new HashSet<DetalleVenta>();
        }

        public int IdVenta { get; set; }
        public string? NumeroVenta { get; set; }
        public int? IdTipoDocumentoVenta { get; set; }
        public int? IdUsuario { get; set; }
        public string? DocumentoCliente { get; set; }
        public string? NombreCliente { get; set; }
        public decimal? SubTotal { get; set; }
        public decimal? ImpuestoTotal { get; set; }
        public decimal? Total { get; set; }
        public DateTime? FechaRegistro { get; set; }

        //[XmlElement("Traslados")]
        //public string? Traslados { get; set; }

        //[XmlElement("moneda")]
        //public string? Moneda { get; set; }

        //[XmlElement("tipoCambio")]
        //public decimal? TipoCambio { get; set; }

        //[XmlElement("tipoDeComprobante")]
        //public string? TipoDeComprobante { get; set; }

        //[XmlElement("exportacion")]
        //public string? Exportacion { get; set; }

        public virtual TipoDocumentoVenta? IdTipoDocumentoVentaNavigation { get; set; }
        public virtual Usuario? IdUsuarioNavigation { get; set; }
        public virtual ICollection<DetalleVenta> DetalleVenta { get; set; }
    }
}
