using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Articulo
    {
        public Articulo()
        {
            Id = 0;
            Codigo = "";
            Nombre = "";
            Descripcion = "";
            Marca = new Marca();
            Categoria = new Categoria();
            Imagen = "";
            Precio = 0;
            Cantidad = 1;
        }
        public Articulo(string codigoArt, string nombreArt, string descripcionArt, Marca marcaArt, Categoria categoriaArt, string imagenes, decimal precio, int cantidad)
        {
            Codigo = codigoArt;
            Nombre = nombreArt;
            Descripcion = descripcionArt;
            Marca = marcaArt;
            Categoria = categoriaArt;
            Imagen = imagenes;
            Precio = precio;
            Cantidad = cantidad;
        }
        public int Id { get; set; }
        [DisplayName("Código")]
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        [DisplayName("Descripción")]
        public string Descripcion { get; set; }
        public Marca Marca { get; set; }
        [DisplayName("Categoría")]
        public Categoria Categoria { get; set; }
        [DisplayName("Imágenes")]
        public List<string> Imagenes { get; set; }

        public int Cantidad { get; set; }
        public string Imagen { get; set; }
        public decimal Precio { get; set; }

    }
}
