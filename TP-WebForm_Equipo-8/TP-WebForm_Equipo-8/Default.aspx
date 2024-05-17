<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TP_WebForm_Equipo_8.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="~/Content/Styles/styles.css" rel="stylesheet" type="text/css"/>
    
    <div class="text-center mt-4">
        <h1>Articulos</h1>
    </div>

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <asp:Repeater ID="repArticulos" runat="server">
            <ItemTemplate>
                <div class="col">
                    <div class="card shadow-sm" style="width: 100%; margin: auto;">
                        <img src="<%# Eval("Imagen") %>" class="card-img-top" alt="Imagen del Articulo" style="height: 200px; object-fit: cover; margin: auto; width: auto;" onerror="this.onerror=null;this.src='https://www.svgrepo.com/show/508699/landscape-placeholder.svg';">
                        <div class="card-body">
                            <h5 class="card-title"><%#Eval("Nombre") %></h5>
                            <p class="card-text"><%#Eval("Descripcion") %></p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><strong>Marca:</strong> <%#Eval("Marca") %> </li>
                            <li class="list-group-item"><strong>Categoria:</strong> <%#Eval("Categoria") %></li>
                            <li class="list-group-item"><strong>Precio:</strong> <%#Eval("Precio") %></li>
                        </ul>
                        <div class="card-body text-center">
                            <asp:Button ID="btnAgregarAlCarrito" runat="server" Text="Agregar al carrito" OnClick="btnAgregarAlCarrito_Click" CssClass="btn btn-success" CommandArgument='<%# Eval("Id") %>' CommandName="ArticuloId" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

