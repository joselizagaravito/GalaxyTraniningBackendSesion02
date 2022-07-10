namespace Sol.TallerNet.ApiVentas.Applcations.Dtos.Output
{
    public class ArticuloByIdOutput
    {
        public int IdArticulo { get; set; }
        public string? Nombre { get; set; }
        public decimal Precio { get; set; }
        public decimal Costo { get; set; }
        public DateTime? FechaRegistro { get; set; }
    }
}
