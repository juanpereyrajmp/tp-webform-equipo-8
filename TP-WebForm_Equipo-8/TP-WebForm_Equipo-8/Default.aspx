<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TP_WebForm_Equipo_8.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .titulo {
            text-align: center;
            margin: 20px 0 40px;
            padding: 5px 10px;
            color: black;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            letter-spacing: 2px;
            display: inline-block;
        }

        .input-group .btn {
            margin-left: 10px;
            border-radius: 10px;
        }
    </style>

    <div class="text-center mt-4">
        <h1 class="titulo">Articulos</h1>

        <!-- Barra de búsqueda con icono de lupa -->
        <div class="input-group mb-3">
            <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" style="border-radius: 10px;" placeholder="Buscar por nombre..." AutoPostBack="False" OnTextChanged="txtBuscar_TextChanged" oninput="buscarArticulos()"></asp:TextBox>
            <div class="input-group-append">
                <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-success" OnClick="btnBuscar_Click" Text='Buscar'  />
                
            </div>
        </div>

        <div class="row row-cols-1 row-cols-md-4 g-4">
            <asp:Repeater ID="repArticulos" runat="server">
                <ItemTemplate>
                    <div class="col">
                        <div class="card shadow-sm" style="width: 100%; margin: auto;">
                            <img src="<%# Eval("Imagen") %>" class="card-img-top" alt="Imagen del Articulo" style="height: 100px; object-fit: cover; margin: auto; width: auto;" onerror="this.onerror=null;this.src='https://www.svgrepo.com/show/508699/landscape-placeholder.svg';">
                            <div class="card-body">
                                <p class="card-title"><%#Eval("Nombre") %></p>
                            </div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item"><strong>Precio: </strong>$ <%# String.Format("{0:F2}", Eval("Precio")) %></li>
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
