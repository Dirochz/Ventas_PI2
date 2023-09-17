using SistemaVenta.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaVenta.BLL.Interfaces
{
    public   interface IUsuarioService
    {

        Task<List<Usuario>> Lista();
        Task<Usuario> Crear(Usuario entidad, Stream Foto = null, string NombreFoto = "", string UrlPlantillaCorreo = "");
        Task<Usuario> Editar(Usuario entidad, Stream Foto = null, string NombreFoto = "");

        Task<bool> Eliminar(int IdUsuario);

        Task<Usuario> ObtenerPorCredenciales(string correo, string clave);

        Task<Usuario> ObtenerPorId(int IdUsuario);

        Task<bool> GuardarPefil(Usuario entidad);

        Task<bool> CambiarClave(int IdUsuario, string ClaveActual, string ClaveNueva);

        Task<bool> RestablecerClave(string Correo, string UrlPlantillaCorreo);


    }
}
