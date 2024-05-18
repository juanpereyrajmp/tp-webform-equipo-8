using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using manager;
using dominio;
using System.Text;

namespace TP_WebForm_Equipo_8
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulos { get; set; }
        public Articulo articuloSeleccionado { get; set; }
        //Articulo Articulo { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            //ArticuloManager negocio = new ArticuloManager();
            //int id = Convert.ToInt32(Request.QueryString["articuloId"]);
            ////Articulo = negocio.ListarArticulosConId(id);
            //ListaArticulos = negocio.ListarArticulos();
            //var articulo = ListaArticulos.FirstOrDefault(a => a.Id == id);

            //if (articulo != null)
            //{
            //    // Crear una lista con un solo artículo
            //    var listaDeUnArticulo = new List<Articulo> { articulo };

            //    // Enlazar la lista al Repeater
            //    repDetalle.DataSource = listaDeUnArticulo;
            //    repDetalle.DataBind();
            //}

            if (Session["ListaArticulos"] != null)
            {
                List<Articulo> seleccionados = (List<Articulo>)Session["ListaArticulos"];
                int id = Convert.ToInt32(Request.QueryString["articuloId"]);



                if (!IsPostBack)
                {
                    // repEliminar.DataSource = seleccionados;
                    //repEliminar.DataBind();
                    var articulo = seleccionados.FirstOrDefault(a => a.Id == id);
                    var listaDeUnArticulo = new List<Articulo> { articulo };
                    repDetalle.DataSource = listaDeUnArticulo;
                    repDetalle.DataBind();

                }

            }





            //ArticuloManager negocio = new ArticuloManager();
            //ListaArticulos = negocio.listaParaImagenes();

            //if (!IsPostBack)
            //{
            //    repDetalle.DataSource = ListaArticulos;
            //    repDetalle.DataBind();
            //}
            //if (Session["ListaArticulos"] == null)
            //{
            //    Session.Add("ListaArticulos", ListaArticulos);
            //    repDetalle.DataSource = ListaArticulos;
            //    repDetalle.DataBind();
            //}




            //if (Session["ListaArticulos"] != null)
            //{
            //    List<Articulo> ListaArticulos = (List<Articulo>)Session["ListaArtuclos"];

            //    if (Session["Id"] != null)
            //    {
            //        int articuloId = Convert.ToInt32(Session["Id"]);
            //        Articulo articuloSel = ListaArticulos.FirstOrDefault(a => a.Id == articuloId);

            //        if(articuloSel != null)
            //        {
            //            if (!IsPostBack)
            //            {
            //                // repEliminar.DataSource = seleccionados;
            //                //repEliminar.DataBind();
            //                repDetalle.DataSource = new List<Articulo> { articuloSel};
            //                repDetalle.DataBind();

            //            }

            //        }
            //    }


            //    //foreach (Articulo item in ListaArticulos)
            //    //{
            //    //    if (Articulo.Id == item.Id)
            //    //  {
            //    //        repDetalle.DataSource = Articulo;
            //    //        repDetalle.DataBind();
            //    //    }
            //    //}


            //    //if (!IsPostBack)
            //    //{
            //    //    // repEliminar.DataSource = seleccionados;
            //    //    //repEliminar.DataBind();
            //    //   repDetalle.DataSource = Articulo;
            //    //   repDetalle.DataBind();

            //    //}

            //}

        }

        protected string GenerateCarouselItems(object dataItem)
        {
            // Obtener las imágenes del artículo actual
            var articulo = (Articulo)dataItem;
            var imagenesManager = new ImagenManager();
            var imagenes = imagenesManager.listarPorIdArticulo(articulo.Id);

            // Generar los elementos del carrusel
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < imagenes.Count; i++)
            {
                sb.Append("<div class=\"carousel-item");
                if (i == 0)
                    sb.Append(" active");
                sb.Append("\">");

                // Verificar si la URL de la imagen es nula o vacía
                if (!string.IsNullOrEmpty(imagenes[i].Url))
                {
                    sb.Append($"<img src=\"{imagenes[i].Url}\" class=\"d-block w-100\" alt=\"Imagen {i + 1}\">");
                }
                else
                {
                    // Mostrar un placeholder en caso de que la URL de la imagen sea nula o vacía
                    sb.Append("<img src=\"https://www.svgrepo.com/show/508699/landscape-placeholder.svg\" class=\"d-block w-100\" alt=\"Placeholder\">");
                }

                sb.Append("</div>");
            }

            // Devolver las etiquetas HTML generadas como una cadena
            return sb.ToString();
        }



        protected void btnAgregarAlCarrito_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int articuloId = Convert.ToInt32(btn.CommandArgument);
            //Carrito carrito = new Carrito();

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
            //Response.Redirect(Request.RawUrl);
            Response.Redirect("FormCarrito.aspx");
        }

       
    }
}