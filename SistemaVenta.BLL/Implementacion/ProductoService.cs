using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Microsoft.EntityFrameworkCore;
using SistemaVenta.BLL.Interfaces;
using SistemaVenta.DAL.Interfaces;
using SistemaVenta.Entity;

namespace SistemaVenta.BLL.Implementacion
{
    public class ProductoService : IProductoService
    { 


        private readonly IGenericRepository<Producto> _repositorio;
        private readonly IFireBaseService _fireBaseServicio;

        public ProductoService(IGenericRepository<Producto> repositorio,
            IFireBaseService fireBaseServicio)
        {
            _repositorio = repositorio;
            _fireBaseServicio = fireBaseServicio;

        }

        public async Task<List<Producto>> Lista()
        {
            IQueryable<Producto> query = await _repositorio.Consultar();
            return query.Include(c => c.IdCategoriaNavigation).ToList();


        }
        public async Task<Producto> Crear(Producto entidad, Stream imagen = null, string NombreImagen = "")
        {
            Producto producto_existe = await _repositorio.Obtener(p => p.CodigoBarra == entidad.CodigoBarra);

            if(producto_existe != null)
                throw new TaskCanceledException("El codigo de barra ya existe");

            try
            {
                entidad.NombreImagen = NombreImagen;
                if (imagen != null) {
                    string urlImage = await _fireBaseServicio.SubirStorage(imagen, "carpeta_producto", NombreImagen);
                    entidad.UrlImagen = urlImage;
                
                }

                Producto producto_creado = await _repositorio.Crear(entidad);

                if (producto_creado.IdProducto == 0) 
                    throw new TaskCanceledException("No se pudo crear el producto");
                
                IQueryable<Producto> query = await _repositorio.Consultar(p => p.IdProducto == producto_creado.IdProducto);

                producto_creado =  query.Include(c => c.IdCategoriaNavigation).First();

                return producto_creado;
            }
            catch (Exception ex) {

                throw;
            }

        }

        public async Task<Producto> Editar(Producto entidad, Stream imagen = null, string NombreImagen = "")
        {
            Producto producto_existe = await _repositorio.Obtener(p => p.CodigoBarra == entidad.CodigoBarra && p.IdProducto != entidad.IdProducto);

            if(producto_existe != null)
                throw new TaskCanceledException("El codigo de barra ya existe");

            try
            {
                IQueryable<Producto> queryProducto = await _repositorio.Consultar(p => p.IdProducto == entidad.IdProducto);

                Producto producto_para_editar = queryProducto.First();

                producto_para_editar.CodigoBarra = entidad.CodigoBarra;
                producto_para_editar.Marca = entidad.Marca;
                producto_para_editar.Descripcion = entidad.Descripcion;
                producto_para_editar.IdCategoria = entidad.IdCategoria;
                producto_para_editar.Stock = entidad.Stock;
                producto_para_editar.Precio = entidad.Precio;
                producto_para_editar.EsActivo = entidad.EsActivo;

                if (producto_para_editar.NombreImagen == "") {
                    producto_para_editar.NombreImagen = NombreImagen;
                }

                if (imagen != null) {
                    string urlImagen = await _fireBaseServicio.SubirStorage(imagen, "carpeta_producto", producto_para_editar.NombreImagen);
                    producto_para_editar.UrlImagen = urlImagen;
                }

                bool respuesta = await _repositorio.Editar(producto_para_editar);

                if(!respuesta)
                    throw new TaskCanceledException("No se pudo editar el producto");


                Producto producto_editado = queryProducto.Include(c => c.IdCategoriaNavigation).First();

                return producto_editado;

            }
            catch {
                throw;
            }
        }

        public async Task<bool> Eliminar(int idProducto)
        {
            try
            {
                Producto producto_encontrado = await _repositorio.Obtener(p => p.IdProducto == idProducto);

                if(producto_encontrado == null)
                    throw new TaskCanceledException("El producto no existe");

                string nombreImagen = producto_encontrado.NombreImagen;

                bool respuesta = await _repositorio.Eliminar(producto_encontrado);

                if (respuesta)
                    await _fireBaseServicio.EliminarStorage("carpeta_producto", nombreImagen);

                return true;

            }
            catch {
                throw;
            }
        }

     
    }
}
