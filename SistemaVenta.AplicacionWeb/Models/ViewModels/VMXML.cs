namespace SistemaVenta.AplicacionWeb.Models.ViewModels
{
    public class VMXML
    {
        public class Empresa
        {
            public string? Nombre { get; set; }
            public string? Direccion { get; set; }
            public string? ClaveContribuyente { get; set; }
        }

        public class ProductoInfo
        {
            public string? Nombre { get; set; }
            public decimal? Precio { get; set; }
        }

        public class ClienteInfo
        {
            public string? Nombre { get; set; }
            public string? Domicilio { get; set; }
            public string? RFC { get; set; }
            public string? FechaExpedicion { get; set; }
        }

        public class FacturaData
        {
            public string? NumeroVenta { get; set; }
            public string? Total { get; set; }
            public Empresa Empresa { get; set; }
            public ProductoInfo Producto { get; set; }
            public ClienteInfo Cliente { get; set; }
        }

    }
}
