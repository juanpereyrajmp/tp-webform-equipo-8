using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using manager;
using dominio;

namespace TP_WebForm_Equipo_8
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloManager negocio = new ArticuloManager();
            ListaArticulos = negocio.listaParaImagenes();

            if (!IsPostBack)
            {
                repArticulos.DataSource = ListaArticulos;
                repArticulos.DataBind();
            }
            //if (Session["ListaArticulos"] == null)
            //{
            //    Session.Add("ListaArticulos", ListaArticulos);
            //    repArticulos.DataSource = ListaArticulos;
            //    repArticulos.DataBind();
            //}
        }

        protected void btnAgregarAlCarrito_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int articuloId = Convert.ToInt32(btn.CommandArgument);
            Carrito carrito = new Carrito();

            ArticuloManager negocio = new ArticuloManager();
            //ListaArticulos = negocio.listaParaImagenes();
            ListaArticulos = negocio.ListarArticulos();


            List<Articulo> seleccionados;
            if (Session["Seleccionados"] == null)
            {
                seleccionados = new List<Articulo>();
            }
            else
            {
                seleccionados = (List<Articulo>)Session["Seleccionados"];
            }

            //foreach (Articulo item in ListaArticulos)
            //{
            //    // Si el ID del artículo coincide con el ID del artículo del botón, lo agrega a la lista de seleccionados
            //    if (articuloId == item.Id)
            //    {
            //        // Agrega el artículo a la lista de seleccionados
            //        seleccionados.Add(item);
            //        // Detenemos la búsqueda una vez que el artículo se ha encontrado y agregado
            //        break;
            //    }
            //}


            foreach (Articulo item in ListaArticulos)
            {
                if (articuloId == item.Id)
                {

                    if (!seleccionados.Any(a => a.Id == item.Id))
                    {
                        seleccionados.Add(item);

                    }

                    break;
                }
            }


            //foreach (Articulo item in ListaArticulos)
            //{
            //    if (articuloId == item.Id)
            //  {
            //       seleccionados.Add(item);
            //    }
            //}

            Session["Seleccionados"] = seleccionados;
            Response.Redirect(Request.RawUrl);
        }
    }
}