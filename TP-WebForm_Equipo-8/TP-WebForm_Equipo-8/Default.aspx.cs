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
        }

        protected void btnVerDetalle_Click(object sender, EventArgs e)
        {

        }
    }
}