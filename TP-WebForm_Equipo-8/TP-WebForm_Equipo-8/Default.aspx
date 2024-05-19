<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TP_WebForm_Equipo_8.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .input-group .btn {
            margin-left: 10px;
            border-radius: 30px;
        }

        .btn-custom {
            background-color: white;
            border: solid 2px #7bc947;
            color: #7bc947;
        }

            .btn-custom:hover {
                background-color: #7bc947;
                border: solid 2px #7bc947;
                color: white;
            }

        .btn-custom2 {
            background-color: white;
            border-color: white;
            color: black;
            border-radius: 30px;
            border: solid 2px white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.2);
            font-size: 15px;
            width: auto;
            height: auto;
        }

            .btn-custom2:hover {
                background-color: #7bc947;
                box-shadow: 0 2px 4px rgba(0,0,0,0.2);
                border: solid 2px #7bc947;
                color: white;
            }

        .card-title{
            font-family: 'Righteous';
        }

        .card-body {
            
            font-size: 20px;
        }

        .list-group-item {
            color: #7bc947;
        }
    </style>

    <div class="text-center mt-4">


        <!-- Barra de búsqueda con icono de lupa -->
        <div class="input-group mb-3">
            <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" Style="border-radius: 30px;" placeholder="Buscar por nombre..." AutoPostBack="False" OnTextChanged="txtBuscar_TextChanged" oninput="buscarArticulos()"></asp:TextBox>
            <div class="input-group-append">
                <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-custom" OnClick="btnBuscar_Click" Text='Buscar' />

            </div>
        </div>

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
