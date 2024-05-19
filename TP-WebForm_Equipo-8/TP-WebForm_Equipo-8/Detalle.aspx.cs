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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ListaArticulos"] != null)
            {
                List<Articulo> seleccionados = (List<Articulo>)Session["ListaArticulos"];
                int id = Convert.ToInt32(Request.QueryString["articuloId"]);

                if (!IsPostBack)
                {
                    var articulo = seleccionados.FirstOrDefault(a => a.Id == id);
                    var listaDeUnArticulo = new List<Articulo> { articulo };
                    repDetalle.DataSource = listaDeUnArticulo;
                    repDetalle.DataBind();
                }
            }
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
                    sb.Append($"<img src=\"{imagenes[i].Url}\" class=\"d-block w-100 card-img-top\"  alt =\"Imagen {i + 1}\">");
                }
                else
                {
                    // Mostrar un placeholder en caso de que la URL de la imagen sea nula o vacía
                    sb.Append("<img src=\"https://www.svgrepo.com/show/508699/landscape-placeholder.svg\" class=\"d-block w-100 card-img-top\"  alt=\"Placeholder\">");
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

            ArticuloManager negocio = new ArticuloManager();
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

            foreach (Articulo item in ListaArticulos)
            {
                if (articuloId == item.Id)
                {

                    if (!seleccionados.Any(a => a.Id == item.Id))
                    {
                        seleccionados.Add(item);

                    }
                    else
                    {
                        Articulo articuloExistente = seleccionados.First(a => a.Id == item.Id);
                        articuloExistente.Cantidad++;
                    }
                    break;
                }
            }
            Session["Seleccionados"] = seleccionados;
            Response.Redirect("FormCarrito.aspx");
        }
    }
}