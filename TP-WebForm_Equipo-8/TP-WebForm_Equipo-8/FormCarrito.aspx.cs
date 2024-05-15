using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_WebForm_Equipo_8
{
    public partial class FormCarrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Seleccionados"] != null)
            {
                List<Articulo> seleccionados = (List<Articulo>)Session["Seleccionados"];

                if (!IsPostBack)
                {
                    repEliminar.DataSource = seleccionados;
                    repEliminar.DataBind();

                    

                }

            }
        }

        protected void btnEliminarDelCarrito_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int articuloId = Convert.ToInt32(btn.CommandArgument);

            List<Articulo> seleccionados;
            if (Session["Seleccionados"] != null) { seleccionados = (List<Articulo>)Session["Seleccionados"]; }
            else { seleccionados = new List<Articulo>(); }

            List<Articulo> nuevaLista = new List<Articulo>();
            bool eliminado = false;

            foreach (var articulo in seleccionados)
            {
                if (!eliminado && articulo.Id == articuloId) { eliminado = true; }
                else { nuevaLista.Add(articulo); }
            }

            Session["Seleccionados"] = nuevaLista;
            Response.Redirect(Request.RawUrl);
            repEliminar.DataSource = nuevaLista;
            repEliminar.DataBind();
        }
    }
}