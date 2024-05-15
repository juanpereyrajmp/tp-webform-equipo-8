<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TP_WebForm_Equipo_8.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="text-center mt-4">
        <h1>Artículos</h1>
    </div>
    <div class="row row-cols-1 row-cols-md-3 g-4">

        <asp:Repeater ID="repArticulos" runat="server">
            <ItemTemplate>

                <div class="col">
                    <div class="card" style="width: 100%; margin:auto;">
                        <img src="<%# Eval("Imagen") %>" class="card-img-top" alt="..." style="height: 200px; object-fit: cover; margin: auto; width:auto;">
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
                            <a href="#" class="card-link">Agregar al carrito</a>
                        </div>
                    </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>

    </div>

</asp:Content>

