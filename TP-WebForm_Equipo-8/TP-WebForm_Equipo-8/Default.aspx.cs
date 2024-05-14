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
            ArticuloManager manager = new ArticuloManager();
            //dvgArticulos.DataSource = manager.ListarArticulosConSP();
            //dvgArticulos.DataBind();
            //ListaArticulos = manager.ListarArticulosConSP();
            ListaArticulos = manager.ListarArticulos();
            repArticulos.DataSource = ListaArticulos;
            repArticulos.DataBind();
        }
    }
}