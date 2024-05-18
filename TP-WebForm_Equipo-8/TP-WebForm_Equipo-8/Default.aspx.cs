using dominio;
using manager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_WebForm_Equipo_8
{
    public partial class Home : System.Web.UI.Page
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
            if (Session["ListaArticulos"] == null)
            {
               Session.Add("ListaArticulos", ListaArticulos);
               repArticulos.DataSource = ListaArticulos;
               repArticulos.DataBind();
            }
        }

        protected void btnVerDetalle_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int articuloId = Convert.ToInt32(btn.CommandArgument);

            ArticuloManager negocio = new ArticuloManager();
            ListaArticulos = negocio.ListarArticulos();

            List<Articulo> seleccionados;
            if (Session["Seleccion"] == null)
            //if (Session["ListaArticulos"] == null)
            {
                seleccionados = new List<Articulo>();
            }
            else
            {
                seleccionados = (List<Articulo>)Session["Seleccion"];
            }

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
            Session["ListaArticulos"] = seleccionados;
            //Response.Redirect(Request.RawUrl);
            Response.Redirect("Detalle.aspx?articuloId=" + articuloId);
        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {

        }

        public List<Articulo> BuscarArticulos(string textoBusqueda)
        {
            // Aquí simulamos una lista de artículos
            ArticuloManager manager = new ArticuloManager();
            List<Articulo> listaArticulos = manager.ListarArticulos();

            // Filtramos la lista de artículos según el texto de búsqueda
            List<Articulo> articulosEncontrados = listaArticulos.FindAll(
                a => a.Nombre.ToLower().Contains(textoBusqueda.ToLower())
            );

            return articulosEncontrados;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string textoBusqueda = txtBuscar.Text;

            // Realiza la búsqueda en tus datos utilizando el texto de búsqueda
            List<Articulo> articulosEncontrados = BuscarArticulos(textoBusqueda);
            

            // Enlaza los resultados de la búsqueda al control de Repeater
            repArticulos.DataSource = articulosEncontrados;
            repArticulos.DataBind();
        }

        protected void txtBuscar_TextChanged1(object sender, EventArgs e)
        {

        }
    }
}