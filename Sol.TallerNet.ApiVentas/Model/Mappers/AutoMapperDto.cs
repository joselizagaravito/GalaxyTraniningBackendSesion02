using AutoMapper;
using Sol.TallerNet.ApiVentas.Repositories.Entities;
using Sol.TallerNet.ApiVentas.Applcations.Dtos.Output;

namespace Sol.TallerNet.ApiVentas.Model.Mappers
{
    public class AutoMapperDto : Profile
    {
        public AutoMapperDto()
        {
            CreateMap<Usuario, UserAutenticaOutput>()
                .ForMember(dto => dto.Codigo, map => map.MapFrom(source => source.IdUsuario))
                .ForMember(dto => dto.Credencial, map => map.MapFrom(source => source.Credenciales))
                .ForMember(dto => dto.Nombre, map => map.MapFrom(source => source.Nombres))
                .ForMember(dto => dto.Perfil, map => map.MapFrom(source => source.Perfil))
                ;


            CreateMap<Pedido, PedidoByIdOutput>()
               .ForMember(dto => dto.Codigo, map => map.MapFrom(source => source.IdPedido))
               .ForMember(dto => dto.Fecha, map => map.MapFrom(source => source.Fecha))
               .ForMember(dto => dto.NombreUsuario, map => map.MapFrom(source => source.Usuario.Nombres))
               ;
            ///revisar cuando sea nulo

            CreateMap<Articulo, ArticuloByIdOutput>()
               .ForMember(dto => dto.IdArticulo, map => map.MapFrom(source => source.IdArticulo))
               .ForMember(dto => dto.Nombre, map => map.MapFrom(source => source.Nombre))
               .ForMember(dto => dto.FechaRegistro, map => map.MapFrom(source => source.FechaRegistro))
               .ForMember(dto => dto.Precio, map => map.MapFrom(source => source.Precio))
               .ForMember(dto => dto.Costo, map => map.MapFrom(source => source.Costo))
               ;
        }
    }
}
