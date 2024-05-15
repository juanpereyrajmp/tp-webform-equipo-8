﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TP_WebForm_Equipo_8.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="~/Content/Styles/styles.css" rel="stylesheet" type="text/css"/>
    
    <div class="text-center mt-4">
        <h1>Artículos</h1>
    </div>

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <asp:Repeater ID="repArticulos" runat="server">
            <ItemTemplate>
                <div class="col">
                    <div class="card" style="width: 100%; margin: auto;">
                        <img src="<%# Eval("Imagen") %>" class="card-img-top" alt="..." style="height: 200px; object-fit: cover; margin: auto; width: auto;">
                        <div class="card-body">
                            <h5 class="card-title"><%#Eval("Nombre") %></h5>
                            <p class="card-text"><%#Eval("Descripcion") %></p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><%#Eval("Marca") %> </li>
                            <li class="list-group-item"><%#Eval("Categoria") %></li>
                            <li class="list-group-item"><%#Eval("Precio") %></li>
                        </ul>
                        <div class="card-body">
                            <asp:Button ID="btnAgregarAlCarrito" runat="server" Text="Agregar al carrito" OnClick="btnAgregarAlCarrito_Click" CssClass="btn btn-primary" CommandArgument='<%# Eval("Id") %>' CommandName="ArticuloId" OnClientClick="actualizarContador(); return true;" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function actualizarContador() {
            $.ajax({
                url: 'Default.aspx/ObtenerCantidadCarrito',
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {

                    contadorCarrito.textContent = data.d;
                },

            });
        }
    </script>

</asp:Content>

