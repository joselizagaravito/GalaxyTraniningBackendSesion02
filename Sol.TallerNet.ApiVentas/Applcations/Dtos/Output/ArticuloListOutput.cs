namespace Sol.TallerNet.ApiVentas.Applcations.Dtos.Output
{
    public class ArticuloListOutput
    {
        public List<ArticuloByIdOutput> Data { get; set; }
        public int TotalReg { get; set; }
        public int PagActual { get; set; }
        public int RegXPag { get; set; }
    }
}
