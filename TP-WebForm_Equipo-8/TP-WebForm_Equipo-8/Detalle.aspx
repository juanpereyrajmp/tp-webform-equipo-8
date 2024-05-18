<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="TP_WebForm_Equipo_8.Default" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="~/Content/Styles/styles.css" rel="stylesheet" type="text/css" />

    <div class="text-center mt-4">
        <h1>Detalle del artículo</h1>
    </div>

    <style>
        .card-img-top {
            width: 100px; /* ajusta el tamaño  */
            height: auto;
        }

        .galeria {
            max-width: 400px; /* ajusta el ancho máximo  */
            margin: auto; /* centrar el contenedor horizontalmente */
        }

        .carousel-control-prev-icon,
        .carousel-control-next-icon {
            filter: invert(1); /* Invierte el color de las flechas del carrusel */
        }
    </style>

    <div class="row row-cols-1 row-cols-lg-1 g-4 galeria">
        <asp:Repeater ID="repDetalle" runat="server">
            <ItemTemplate>
                <div class="col">
                    <div class="card shadow-sm border-0">
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
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var replacedImages = [];

            function replaceIfBroken(img) {
                if (!img.complete || img.naturalHeight === 0 || img.naturalWidth === 0) {
                    img.src = 'https://www.svgrepo.com/show/508699/landscape-placeholder.svg';
                }
            }

            function applyImageReplacement(carousel) {
                var activeItem = carousel.querySelector('.carousel-item.active img');
                if (activeItem && !replacedImages.includes(activeItem.src)) {
                    replaceIfBroken(activeItem);
                    replacedImages.push(activeItem.src);
                }
            }

            // Agregar lógica para ocultar flechas de control cuando solo hay una imagen
            var carousels = document.querySelectorAll('.carousel');
            carousels.forEach(function (carousel) {
                var carouselItems = carousel.querySelectorAll('.carousel-item');
                if (carouselItems.length <= 1) {
                    carousel.querySelector('.carousel-control-prev').style.display = 'none';
                    carousel.querySelector('.carousel-control-next').style.display = 'none';
                }

                applyImageReplacement(carousel);
                carousel.addEventListener('slid.bs.carousel', function () {
                    applyImageReplacement(carousel);
                });
            });
        });
    </script>






    <%--<asp:Repeater ID="repArticulos" runat="server">
            <ItemTemplate>
                <div class="col">
                    <div class="card shadow-sm" style="width: 100%; margin: auto;">
                        <img src="<%# Eval("Imagen") %>" class="card-img-top" alt="Imagen del Articulo" style="height: 500px; object-fit: cover; margin: auto; width: auto;" onerror="this.onerror=null;this.src='https://www.svgrepo.com/show/508699/landscape-placeholder.svg';">
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
        </asp:Repeater>--%>
</asp:Content>

