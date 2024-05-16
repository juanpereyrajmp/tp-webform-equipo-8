using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Carrito
    {
        public Carrito()
        {
            Id = 0;
            Cantidad = 0;
            Precio = 0;
            Total = 0;
            
        }
        public Carrito(int codigoArt, int cantidad, decimal precio)
        {
            Id = codigoArt;
            Cantidad = cantidad;
            Total = cantidad*precio;
            Precio = precio;
        }
        public int Id { get; set; }
        [DisplayName("Código")]
        public int Cantidad { get; set; }
        public decimal Total { get; set; }
        public decimal Precio { get; set; }

    }
}
