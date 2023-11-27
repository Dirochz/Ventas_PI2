using System;
using System.Collections.Generic;
using System.Xml.Serialization;

namespace SistemaVenta.Entity
{
    public partial class DetalleVenta
    {
        public int IdDetalleVenta { get; set; }
        public int? IdVenta { get; set; }
        public int? IdProducto { get; set; }
        public string? MarcaProducto { get; set; }
        public string? DescripcionProducto { get; set; }
        public string? CategoriaProducto { get; set; }
        public int? Cantidad { get; set; }
        public decimal? Precio { get; set; }
        public decimal? Total { get; set; }

        [XmlElement("Traslados")]
        public string? Traslados { get; set; }

        [XmlElement("moneda")]
        public string? Moneda { get; set; }

        [XmlElement("tipoCambio")]
        public decimal? TipoCambio { get; set; }

        [XmlElement("tipoDeComprobante")]
        public string? TipoDeComprobante { get; set; }

        [XmlElement("exportacion")]
        public string? Exportacion { get; set; }

        public virtual Venta? IdVentaNavigation { get; set; }
    }
}
