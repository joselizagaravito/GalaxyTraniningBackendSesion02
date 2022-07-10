using AutoMapper;
using Sol.TallerNet.ApiVentas.Applcations.Dtos.Input;
using Sol.TallerNet.ApiVentas.Applcations.Dtos.Output;
using Sol.TallerNet.ApiVentas.Repositories.Entities;
using Sol.TallerNet.ApiVentas.Repositories.Operations;

namespace Sol.TallerNet.ApiVentas.Applcations.Operations
{
    public class ArticuloApplication : IArticuloApplication
    {
        private readonly IArticuloRepository articuloRepository;
        private readonly IMapper mapper;
        public ArticuloApplication(IArticuloRepository articuloRepository, IMapper mapper)
        {
            this.articuloRepository = articuloRepository;
            this.mapper = mapper;
        }

        public async Task<ArticuloListOutput> Get(string filtro, int regxpag, int nropag)
        {
            ArticuloListInput pli = new ArticuloListInput { Filtro = filtro, NroPag = nropag, RegXPag = regxpag };

            List<Articulo> lista = await articuloRepository.List(pli);
            ArticuloListOutput res = new ArticuloListOutput
            {
                Data = mapper.Map<List<ArticuloByIdOutput>>(lista),
                RegXPag = regxpag,
                PagActual = nropag,
                TotalReg = pli.TotalReg
            };

            return res;
        }

        public Task<ArticuloByIdOutput> Get(int id)
        {
            throw new NotImplementedException();
        }
    }
}
