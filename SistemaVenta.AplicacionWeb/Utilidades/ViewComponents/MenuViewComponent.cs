
using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using SistemaVenta.AplicacionWeb.Models.ViewModels;
using SistemaVenta.BLL.Interfaces;

namespace SistemaVenta.AplicacionWeb.Utilidades.ViewComponents
{
    public class MenuViewComponent : ViewComponent
    {
        private readonly IMenuService _menuServicio;
        private readonly IMapper _mapper;
        public MenuViewComponent(IMenuService menuServicio,
            IMapper mapper)
        {
            _menuServicio = menuServicio;
            _mapper = mapper;
        }


        public async Task<IViewComponentResult> InvokeAsync() {

            ClaimsPrincipal claimUser = HttpContext.User;
            List<VMMenu> listaMenus;


            if (claimUser.Identity.IsAuthenticated)
            {
                string idUsuario = claimUser.Claims
                    .Where(c => c.Type == ClaimTypes.NameIdentifier)
                    .Select(c => c.Value).SingleOrDefault();

                listaMenus = _mapper.Map<List<VMMenu>>(await _menuServicio.ObtenerMenus(int.Parse(idUsuario)));

            }
            else { 
                listaMenus = new List<VMMenu> { };
            }

            return View(listaMenus);

        }

    }
}
