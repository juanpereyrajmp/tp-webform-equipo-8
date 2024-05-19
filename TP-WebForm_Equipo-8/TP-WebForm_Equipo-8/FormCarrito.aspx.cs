using dominio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
                    // repEliminar.DataSource = seleccionados;
                    //repEliminar.DataBind();
                    dgvCarrito.DataSource = seleccionados;
                    dgvCarrito.DataBind();
                    int cant = 0;
                    foreach (Articulo item in seleccionados)
                    {
                        cant += item.Cantidad;

                    }
                    LabTotalCantidad.Text = cant.ToString();

                    decimal total = 0;
                    foreach (Articulo item in seleccionados)
                    {
                        total += item.Precio * item.Cantidad;

                    }
                    LabTotalPrecio.Text = total.ToString();
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
            int codigo = Convert.ToInt32(dgvCarrito.DataKeys[e.RowIndex].Values[0]);
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
            List<Articulo> seleccionados = (List<Articulo>)Session["Seleccionados"];
            dgvCarrito.EditIndex = e.NewEditIndex;
            dgvCarrito.DataSource = seleccionados;
            dgvCarrito.DataBind();
        }


        protected void dgvCarrito_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (Session["Seleccionados"] != null)
            {
                List<Articulo> seleccionados = (List<Articulo>)Session["Seleccionados"];
                GridViewRow fila = dgvCarrito.Rows[e.RowIndex];

                int codigo = Convert.ToInt32(dgvCarrito.DataKeys[e.RowIndex].Values[0]);

                Articulo articuloAActualizar = seleccionados[e.RowIndex];

                if (articuloAActualizar.Id == codigo)
                {
                    TextBox txtCarritoCant = (TextBox)fila.FindControl("txtCarritoCant");
                    if (txtCarritoCant != null)
                    {
                        int nuevaCantidad;
                        if (int.TryParse(txtCarritoCant.Text, out nuevaCantidad))
                        {
                            if (nuevaCantidad > 0 && nuevaCantidad <= 100)
                            {
                                articuloAActualizar.Cantidad = nuevaCantidad;

                                Session["Seleccionados"] = seleccionados;

                                dgvCarrito.EditIndex = -1;
                                dgvCarrito.DataSource = seleccionados;
                                dgvCarrito.DataBind();
                            }
                            else
                            {                         
                                string script = "alert('La cantidad ingresada no es un número válido.');";
                                ScriptManager.RegisterStartupScript(this, GetType(), "CantidadError", script, true);
                            }
                        }
                        else
                        {
                            string script = "alert('La cantidad ingresada no es un número válido.');";
                            ScriptManager.RegisterStartupScript(this, GetType(), "CantidadInvalida", script, true);
                        }
                    }
                }
            }
            Response.Redirect(Request.RawUrl);
        }


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