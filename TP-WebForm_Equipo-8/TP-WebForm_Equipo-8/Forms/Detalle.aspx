<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="TP_WebForm_Equipo_8.Default" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="~/Content/Styles/estilos-detalle.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Titulo -->
    <div class="text-center mt-4">
        <p class="titulo">Detalle del artículo</p>
    </div>

    <!-- Card con detalle del articulo -->
    <div class="row row-cols-1 row-cols-lg-1 g-4 galeria">
        <asp:Repeater ID="repDetalle" runat="server" ClientIDMode="Static">
            <ItemTemplate>
                <div class="col">
                    <div class="card shadow-sm border-0">

                        <!-- Carrousel -->
                        <div id="carousel<%# Eval("Id") %>" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <%# GenerateCarouselItems(Container.DataItem) %>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carousel<%# Eval("Id") %>" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carousel<%# Eval("Id") %>" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>

                        <!-- Nombre y descripción -->
                        <div class="card-body">
                            <h5 class="card-title"><%#Eval("Nombre") %></h5>
                            <p class="card-text"><%#Eval("Descripcion") %></p>
                        </div>

                        <!-- Detalles del artículo -->
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><strong style="font-family: 'Righteous';">Marca:</strong> <%#Eval("Marca") %> </li>
                            <li class="list-group-item"><strong style="font-family: 'Righteous';">Categoria:</strong> <%#Eval("Categoria") %></li>
                            <li class="list-group-item"><strong style="font-family: 'Righteous';">Precio:</strong> $ <%# String.Format("{0:N2}", Eval("Precio")) %></li>
                        </ul>

                        <!-- Boton de Agregar -->
                        <div class="card-body text-center">
                            <asp:Button ID="btnAgregarAlCarrito" runat="server" Text="Agregar al carrito" OnClick="btnAgregarAlCarrito_Click" CssClass="btn btn-customAgregar" CommandArgument='<%# Eval("Id") %>' CommandName="ArticuloId" />
                        </div>

                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <!-- JavaScript -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var replacedImages = [];

            function applyImageReplacement(carousel) {
                var carouselItems = carousel.querySelectorAll('.carousel-item img');
                carouselItems.forEach(function (img) {
                    if (!replacedImages.includes(img.src)) {
                        replaceIfBroken(img);
                        replacedImages.push(img.src);
                    }
                });
            }

            var carousels = document.querySelectorAll('.carousel');
            carousels.forEach(function (carousel) {
                var carouselItems = carousel.querySelectorAll('.carousel-item');
                if (carouselItems.length <= 1) {
                    carousel.querySelector('.carousel-control-prev').style.display = 'none';
                    carousel.querySelector('.carousel-control-next').style.display = 'none';
                }

                carousel.addEventListener('slid.bs.carousel', function () {
                    applyImageReplacement(carousel);
                });

                var carouselImages = carousel.querySelectorAll('img');
                carouselImages.forEach(function (img) {
                    img.addEventListener('load', function () {
                        applyImageReplacement(carousel);
                    });
                });
            });
        });
    </script>

</asp:Content>

