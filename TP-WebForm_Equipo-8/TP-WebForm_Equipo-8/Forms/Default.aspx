<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TP_WebForm_Equipo_8.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="~/Content/Styles/estilos-default.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="text-center mt-4">

        <!-- Barra de búsqueda y botón -->
        <div class="input-group mb-3">
            <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" Style="border-radius: 30px;" placeholder="Buscar por nombre..." AutoPostBack="False" OnTextChanged="txtBuscar_TextChanged" oninput="buscarArticulos()"></asp:TextBox>
            <div class="input-group-append">
                <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-custom" OnClick="btnBuscar_Click" Text='Buscar' />
            </div>
        </div>

        <!-- Cards de artículos -->
        <div class="row row-cols-1 row-cols-md-4 g-4">
            <asp:Repeater ID="repArticulos" runat="server">
                <ItemTemplate>
                    <div class="col">
                        <div class="card shadow-sm" style="width: 100%; margin: auto; border: 2px solid rgb(128, 128, 128, 0.1);">
                            <img src="<%# Eval("Imagen") %>" class="card-img-top" alt="Imagen del Articulo" style="height: 200px; object-fit: cover; margin: auto; width: auto;" onerror="this.onerror=null;this.src='https://simacolor.com.gt/sistema/files/articulos/no.png';">
                            <div class="card-body">
                                <p class="card-title"><%#Eval("Nombre") %></p>
                            </div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item"><strong>$ <%# String.Format("{0:N2}", Eval("Precio")) %></strong> </li>
                            </ul>
                            <div class="card-body text-center">
                                <asp:Button ID="btnVerDetalle" runat="server" Text="Ver detalle" OnClick="btnVerDetalle_Click" CssClass="btn btn-custom2" CommandArgument='<%# Eval("Id") %>' CommandName="ArticuloId" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

    </div>

</asp:Content>
