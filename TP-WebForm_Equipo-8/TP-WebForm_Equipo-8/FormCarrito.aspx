<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="FormCarrito.aspx.cs" Inherits="TP_WebForm_Equipo_8.FormCarrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="text-center mt-4">
        <h1>Lista del carrito</h1>
    </div>

    <section class="body-def">
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <asp:Repeater ID="repEliminar" runat="server">
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
                                <asp:Button ID="btnEliminarDelCarrito" runat="server" Text="Eliminar" OnClick="btnEliminarDelCarrito_Click" CssClass="btn btn-danger" CommandArgument='<%# Eval("Id") %>' CommandName="ArticuloId" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>

</asp:Content>
