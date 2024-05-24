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

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnVerDetalle_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int articuloId = Convert.ToInt32(btn.CommandArgument);

            ArticuloManager negocio = new ArticuloManager();
            ListaArticulos = negocio.ListarArticulos();

            List<Articulo> seleccionados;
            if (Session["Seleccion"] == null)
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
            Response.Redirect("Detalle.aspx?articuloId=" + articuloId);
        }

        public List<Articulo> BuscarArticulos(string textoBusqueda)
        {
            ArticuloManager manager = new ArticuloManager();
            List<Articulo> listaArticulos = manager.ListarArticulos();
            List<Articulo> articulosEncontrados = listaArticulos

                .Where(a => a.Nombre.ToLower().Contains(textoBusqueda.ToLower()))
                .GroupBy(a => a.Nombre) 
                .Select(group => group.First())
                .ToList();

            return articulosEncontrados;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string textoBusqueda = txtBuscar.Text;
            
            List<Articulo> articulosEncontrados = BuscarArticulos(textoBusqueda);

            repArticulos.DataSource = articulosEncontrados;
            repArticulos.DataBind();
        }

    }
}