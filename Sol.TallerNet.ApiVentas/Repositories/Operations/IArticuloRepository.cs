using Sol.TallerNet.ApiVentas.Applcations.Dtos.Input;
using Sol.TallerNet.ApiVentas.Repositories.Entities;

namespace Sol.TallerNet.ApiVentas.Repositories.Operations
{
    public interface IArticuloRepository
    {
        Task<List<Articulo>> List(ArticuloListInput articuloListInput);
        Articulo Insert(Articulo articulo);
        Articulo Update(Articulo articulo);
        Task<Articulo> Get(int id);
    }
}
