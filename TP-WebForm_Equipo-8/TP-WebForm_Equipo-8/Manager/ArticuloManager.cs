using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Permissions;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace manager
{
    public class ArticuloManager
    {
        AccesoDatos datos = new AccesoDatos();
        public List<Articulo> ListarArticulos()
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT A.Id, A.Codigo, A.Nombre, A.Descripcion AS ArticuloDescripcion, M.Descripcion AS Marca, C.Descripcion AS Categoria, A.Precio, I.ImagenUrl, C.Id as IdCategoria, M.Id as IdMarca FROM ARTICULOS A LEFT JOIN MARCAS M ON A.IdMarca = M.Id LEFT JOIN CATEGORIAS C ON A.IdCategoria = C.Id LEFT JOIN IMAGENES I ON A.Id = I.IdArticulo");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();

                    aux.Id = (int)datos.Lector["Id"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Descripcion = (string)datos.Lector["ArticuloDescripcion"];

                    Marca marca = new Marca();

                    if (!Convert.IsDBNull(datos.Lector["Marca"]))
                    {
                        aux.Marca.Id = (int)datos.Lector["IdMarca"];
                        aux.Marca.Descripcion = (string)datos.Lector["Marca"];
                    }
                    else
                    {
                        aux.Marca.Descripcion = "Sin Marca";
                    }

                    Categoria categoria = new Categoria();

                    if (!Convert.IsDBNull(datos.Lector["Categoria"]))
                    {
                        aux.Categoria.Id = (int)datos.Lector["IdCategoria"];
                        aux.Categoria.Descripcion = (string)datos.Lector["Categoria"];
                    }
                    else
                    {
                        aux.Categoria.Descripcion = "Sin categoria";
                    }

                    aux.Precio = (decimal)datos.Lector["Precio"];

                    if (!Convert.IsDBNull(datos.Lector["ImagenUrl"]))
                    {
                        aux.Imagen = (string)datos.Lector["ImagenUrl"];
                    }

                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public List<Articulo> listaParaImagenes()
        {
            List<Articulo> listaArticulos = ListarArticulos();

            if (listaArticulos != null && listaArticulos.Count > 0)
            {
                Dictionary<string, Articulo> diccionarioArticulos = new Dictionary<string, Articulo>();

                foreach (var articulo in listaArticulos)
                {
                    if (!diccionarioArticulos.ContainsKey(articulo.Codigo))
                    {
                        diccionarioArticulos.Add(articulo.Codigo, articulo);
                        articulo.Imagenes = new List<string>();
                    }

                    diccionarioArticulos[articulo.Codigo].Imagenes.Add(articulo.Imagen);
                }

                List<Articulo> listaParaDgv = diccionarioArticulos.Values.ToList();

                return listaParaDgv;
            }
            else
            {
                return new List<Articulo>();
            }
        }
    }
}
