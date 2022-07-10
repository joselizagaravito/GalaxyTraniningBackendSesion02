using Sol.TallerNet.ApiVentas.Applcations.Dtos.Output;

namespace Sol.TallerNet.ApiVentas.Applcations.Operations
{
    public interface IArticuloApplication
    {
        Task<ArticuloListOutput> Get(string filtro, int regxpag, int nropag);
        Task<ArticuloByIdOutput> Get(int id);
    }
}
