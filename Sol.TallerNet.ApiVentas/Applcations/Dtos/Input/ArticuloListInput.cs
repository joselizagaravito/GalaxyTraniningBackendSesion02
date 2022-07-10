namespace Sol.TallerNet.ApiVentas.Applcations.Dtos.Input
{
    public class ArticuloListInput
    {
        public string? Filtro { get; set; }
        public int RegXPag { get; set; }
        public int NroPag { get; set; }
        public int TotalReg { get; set; }
    }
}
