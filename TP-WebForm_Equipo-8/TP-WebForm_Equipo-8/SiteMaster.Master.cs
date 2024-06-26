﻿using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_WebForm_Equipo_8
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            contadorCarrito.CssClass = "contador";

            if (!IsPostBack)
            {
                if (Session["Seleccionados"] != null)
                {
                    List<Articulo> seleccionados = (List<Articulo>)Session["Seleccionados"];
                    int cantidadArticulos = 0;

                    foreach (Articulo item in seleccionados)
                    {
                        cantidadArticulos += item.Cantidad;
                    }

                    contadorCarrito.Text = cantidadArticulos.ToString();

                    if (cantidadArticulos > 0)
                    {
                        contadorCarrito.CssClass = "contador contador-activo";
                    }
                    else
                    {
                        contadorCarrito.CssClass = "contador";
                    }
                }
            }

        }
    }
}