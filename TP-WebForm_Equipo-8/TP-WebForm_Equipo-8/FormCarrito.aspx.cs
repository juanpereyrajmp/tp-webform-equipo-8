using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;

namespace TP_WebForm_Equipo_8
{
    public partial class FormCarrito : System.Web.UI.Page
    {
        Carrito carrito =new Carrito();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Seleccionados"] != null)
            {
                List<Articulo> seleccionados = (List<Articulo>)Session["Seleccionados"];
         

                if (!IsPostBack)
                {
                   // repEliminar.DataSource = seleccionados;
                    //repEliminar.DataBind();
                    dgvCarrito.DataSource = seleccionados;
                    dgvCarrito.DataBind();

                }

            }
        }

        protected void dgvCarrito_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            List<Articulo> seleccionados = (List<Articulo>)Session["Seleccionados"];
            dgvCarrito.EditIndex = -1;
            dgvCarrito.DataSource = seleccionados;
            dgvCarrito.DataBind();
        }

        protected void dgvCarrito_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            List<Articulo> seleccionados = (List<Articulo>)Session["Seleccionados"];
            int codigo = Convert.ToInt32( dgvCarrito.DataKeys[e.RowIndex].Values[0]);
            Articulo articuloAEliminar = seleccionados.FirstOrDefault(a => a.Id == codigo);
            if (articuloAEliminar != null)
            {
                seleccionados.Remove(articuloAEliminar);
   
            }
            dgvCarrito.DataSource = seleccionados;
            dgvCarrito.DataBind();


        }

        protected void dgvCarrito_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void dgvCarrito_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }


        //protected void dgvCarrito_RowEditing(object sender, GridViewUpdateEventArgs e)
        //{
        //    List<Articulo> seleccionados = (List<Articulo>)Session["Seleccionados"];

        //    GridViewRow row = dgvCarrito.Rows[e.RowIndex];
        //    TextBox txtCantidad = (TextBox)row.FindControl("txtCantidad");
        //    int nuevaCantidad = Convert.ToInt32(txtCantidad.Text);

        //    // Actualiza la cantidad en tu fuente de datos, por ejemplo, en una lista de productos en el carrito
        //    int indice = e.RowIndex;
        //    List<Articulo> carrito = Session["Articulo"] as List<Articulo>;
        //    carrito[indice].Cantidad = nuevaCantidad;

        //    // Cancela el modo de edición
        //    //dgvCarrito.EditIndex = -1;

        //    // Vuelve a enlazar los datos al GridView
        //    dgvCarrito.DataSource = seleccionados;
        //    dgvCarrito.DataBind();
        //}

        //protected void btnEliminarDelCarrito_Click(object sender, EventArgs e)
        //{
        //    Button btn = (Button)sender;
        //    int articuloId = Convert.ToInt32(btn.CommandArgument);

        //    List<Articulo> seleccionados;
        //    if (Session["Seleccionados"] != null) { seleccionados = (List<Articulo>)Session["Seleccionados"]; }
        //    else { seleccionados = new List<Articulo>(); }

        //    List<Articulo> nuevaLista = new List<Articulo>();
        //    bool eliminado = false;

        //    foreach (var articulo in seleccionados)
        //    {
        //        if (!eliminado && articulo.Id == articuloId) { eliminado = true; }
        //        else { nuevaLista.Add(articulo); }
        //    }

        //    Session["Seleccionados"] = nuevaLista;
        //    Response.Redirect(Request.RawUrl);
        //    repEliminar.DataSource = nuevaLista;
        //    repEliminar.DataBind();
        //}
    }
}