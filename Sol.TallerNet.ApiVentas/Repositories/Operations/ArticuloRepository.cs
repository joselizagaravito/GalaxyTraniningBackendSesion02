using Microsoft.EntityFrameworkCore;
using Sol.TallerNet.ApiVentas.Applcations.Dtos.Input;
using Sol.TallerNet.ApiVentas.Repositories.Context;
using Sol.TallerNet.ApiVentas.Repositories.Entities;

namespace Sol.TallerNet.ApiVentas.Repositories.Operations
{
    public class ArticuloRepository : IArticuloRepository
    {
        private readonly TallerContext tallerContext;

        public ArticuloRepository(TallerContext tallerContext)
        {
            this.tallerContext = tallerContext;
        }
        public Articulo Get(int id)
        {
            return tallerContext.Articulo.FirstOrDefault(t => t.IdArticulo == id);
        }

        public Articulo Insert(Articulo articulo)
        {
            tallerContext.Add(articulo);
            tallerContext.SaveChanges();
            return articulo;
        }

        public async Task<List<Articulo>> List(ArticuloListInput articuloListInput)
        {
            var list = (from x in tallerContext.Articulo select x);

            if (!string.IsNullOrEmpty(articuloListInput.Filtro))
                list = list.Where(t => t.Nombre.Contains(articuloListInput.Filtro));

            articuloListInput.TotalReg = list.Count();

            var resultado = await list
                .Skip((articuloListInput.NroPag - 1) * articuloListInput.RegXPag)
                .Take(articuloListInput.RegXPag)
                .ToListAsync();

            return resultado;
        }

        public Articulo Update(Articulo articulo)
        {
            tallerContext.Update(articulo);
            tallerContext.SaveChanges();
            return articulo;
        }
    }
}
