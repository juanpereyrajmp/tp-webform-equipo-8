<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TP_WebForm_Equipo_8.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-center mt-4">
        <h1>Home</h1>

        <div class="row row-cols-1 row-cols-md-5 g-4">
            <asp:Repeater ID="repArticulos" runat="server">
                <ItemTemplate>
                    <div class="col">
                        <div class="card shadow-sm" style="width: 100%; margin: auto;">
                            <img src="<%# Eval("Imagen") %>" class="card-img-top" alt="Imagen del Articulo" style="height: 100px; object-fit: cover; margin: auto; width: auto;" onerror="this.onerror=null;this.src='https://www.svgrepo.com/show/508699/landscape-placeholder.svg';">
                            <div class="card-body">
                                <p class="card-title"><%#Eval("Nombre") %></p>
                            </div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item"><strong>Precio: </strong> $ <%# String.Format("{0:F2}", Eval("Precio")) %></li>
                            </ul>
                            <div class="card-body text-center">
                                <asp:Button ID="btnVerDetalle" runat="server" Text="Ver detalle" OnClick="btnVerDetalle_Click" CssClass="btn btn-warning" CommandArgument='<%# Eval("Id") %>' CommandName="ArticuloId" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
