﻿using dominio;
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
        public bool carritoLleno = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Seleccionados"] != null)
            {
                List<Articulo> seleccionados = (List<Articulo>)Session["Seleccionados"];

                carritoLleno = false;

                if (!IsPostBack)
                {
                    dgvCarrito.DataSource = seleccionados;
                    dgvCarrito.DataBind();

                    int cant = 0;

                    foreach (Articulo item in seleccionados)
                    {
                        cant += item.Cantidad;
                        carritoLleno = true;
                    }

                    LabTotalCantidad.Text = "Cantidad de Productos: " + cant.ToString();

                    decimal total = 0;

                    foreach (Articulo item in seleccionados)
                    {
                        total += item.Precio * item.Cantidad;
                    }

                    System.Globalization.CultureInfo customCulture = (System.Globalization.CultureInfo)System.Globalization.CultureInfo.InvariantCulture.Clone();
                    customCulture.NumberFormat.CurrencyDecimalSeparator = ",";
                    customCulture.NumberFormat.CurrencyGroupSeparator = ".";
                    customCulture.NumberFormat.CurrencySymbol = "$";

                    LabTotalPrecio.Text = "Total: " + total.ToString("C2", customCulture);
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
            Response.Redirect(Request.RawUrl);
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
                                Response.Redirect(Request.RawUrl);
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
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            List<Articulo> seleccionados = (List<Articulo>)Session["Seleccionados"];
            seleccionados.Clear();
            LabTotalCantidad.Text = "0";
            LabTotalPrecio.Text = "0";

            string script = "alert('Gracias por la compra.'); window.location='" + Request.RawUrl + "';";
            ScriptManager.RegisterStartupScript(this, GetType(), "CompraAlert", script, true);

        }

        protected void dgvCarrito_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Incrementar" || e.CommandName == "Decrementar" || e.CommandName == "Eliminar")
            {
                int articuloId = Convert.ToInt32(e.CommandArgument);
                List<Articulo> seleccionados = (List<Articulo>)Session["Seleccionados"];

                Articulo articulo = seleccionados.FirstOrDefault(a => a.Id == articuloId);
                if (articulo != null)
                {
                    if (e.CommandName == "Incrementar")
                    {
                        articulo.Cantidad++;
                    }
                    else if (e.CommandName == "Decrementar")
                    {
                        if (articulo.Cantidad > 1)
                        {
                            articulo.Cantidad--;
                        }
                        else
                        {
                            seleccionados.Remove(articulo);
                        }
                    }
                    else if (e.CommandName == "Eliminar")
                    {
                        seleccionados.Remove(articulo);
                    }

                    Session["Seleccionados"] = seleccionados;
                    dgvCarrito.DataSource = seleccionados;
                    dgvCarrito.DataBind();
                }
            }

            Response.Redirect(Request.RawUrl);
        }
    }
}