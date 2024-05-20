<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="TP_WebForm_Equipo_8.Default" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="~/Content/Styles/styles.css" rel="stylesheet" type="text/css" />

    <style>
        .card-img-top {
            width: auto;
            height: 400px;
            object-fit: contain;
            margin: auto;
        }

        .carrousel-item {
            height: 100%;
        }

        .galeria {
            max-width: 600px;
            margin: auto;
        }

        .carousel-control-prev,
        .carousel-control-next {
            width: 40px;
            height: 40px;
            background-color: rgba(0,0,0,0.7);
            display: flex;
            border-radius: 10%;
            margin: 10px;
            margin-top: 30%;
            align-items: center;
            justify-content: center;
        }

        .titulo {
            text-align: center;
            margin: 20px 0;
            padding: 5px 10px;
            color: black;
            font-size: 35px;
        }

        .card-title {
            font-family: 'Righteous';
        }

        .btn-customAgregar {
            background-color: white;
            border: solid 2px #7bc947;
            color: #7bc947;
            border-radius: 30px;
        }

            .btn-customAgregar:hover {
                background-color: #7bc947;
                border: solid 2px #7bc947;
                color: white;
            }
    </style>

    <div class="text-center mt-4">
        <p class="titulo">Detalle del artículo</p>
    </div>

    <div class="row row-cols-1 row-cols-lg-1 g-4 galeria">
        <asp:Repeater ID="repDetalle" runat="server" ClientIDMode="Static">
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
                            <li class="list-group-item"><strong style="font-family: 'Righteous';">Marca:</strong> <%#Eval("Marca") %> </li>
                            <li class="list-group-item"><strong style="font-family: 'Righteous';">Categoria:</strong> <%#Eval("Categoria") %></li>
                            <li class="list-group-item"><strong style="font-family: 'Righteous';">Precio:</strong> $ <%# String.Format("{0:N2}", Eval("Precio")) %></li>
                        </ul>
                        <div class="card-body text-center">
                            <asp:Button ID="btnAgregarAlCarrito" runat="server" Text="Agregar al carrito" OnClick="btnAgregarAlCarrito_Click" CssClass="btn btn-customAgregar" CommandArgument='<%# Eval("Id") %>' CommandName="ArticuloId" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <script>
        //document.addEventListener('DOMContentLoaded', function () {
        //    var replacedImages = [];

        //    function replaceIfBroken(img) {
        //        if (!img.complete || img.naturalHeight === 0 || img.naturalWidth === 0) {
        //            img.src = 'https://simacolor.com.gt/sistema/files/articulos/no.png';
        //        }
        //    }

        //    function applyImageReplacement(carousel) {
        //        var carouselItems = carousel.querySelectorAll('.carousel-item img');
        //        carouselItems.forEach(function (img) {
        //            if (!replacedImages.includes(img.src)) {
        //                replaceIfBroken(img);
        //                replacedImages.push(img.src);
        //            }
        //        });
        //    }

        //    var carousels = document.querySelectorAll('.carousel');
        //    carousels.forEach(function (carousel) {
        //        var carouselItems = carousel.querySelectorAll('.carousel-item');
        //        if (carouselItems.length <= 1) {
        //            carousel.querySelector('.carousel-control-prev').style.display = 'none';
        //            carousel.querySelector('.carousel-control-next').style.display = 'none';
        //        }

        //        applyImageReplacement(carousel);
        //        carousel.addEventListener('slid.bs.carousel', function () {
        //            applyImageReplacement(carousel);
        //        });
        //    });
        //});

        //document.addEventListener('DOMContentLoaded', function () {
        //    var replacedImages = [];

        //    function replaceIfBroken(img) {
        //        if (!img.complete || img.naturalHeight === 0 || img.naturalWidth === 0) {
        //            img.src = 'https://simacolor.com.gt/sistema/files/articulos/no.png';
        //        }
        //    }

        //    function applyImageReplacement(carousel) {
        //        var carouselItems = carousel.querySelectorAll('.carousel-item img');
        //        carouselItems.forEach(function (img) {
        //            if (!replacedImages.includes(img.src)) {
        //                replaceIfBroken(img);
        //                replacedImages.push(img.src);
        //            }
        //        });
        //    }

        //    var carousels = document.querySelectorAll('.carousel');
        //    carousels.forEach(function (carousel) {
        //        var carouselItems = carousel.querySelectorAll('.carousel-item');
        //        if (carouselItems.length <= 1) {
        //            carousel.querySelector('.carousel-control-prev').style.display = 'none';
        //            carousel.querySelector('.carousel-control-next').style.display = 'none';
        //        }

        //        applyImageReplacement(carousel);
        //        carousel.addEventListener('slid.bs.carousel', function () {
        //            applyImageReplacement(carousel);
        //        });
        //    });
        //});

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

                // Escuchar el evento 'load' en cada imagen del carrusel
                var carouselImages = carousel.querySelectorAll('img');
                carouselImages.forEach(function (img) {
                    img.addEventListener('load', function () {
                        applyImageReplacement(carousel);
                    });
                });
            });
        });

        function addCacheBusterToImages() {
            // Obtener todas las imágenes dentro del repeater
            var repeaterImages = document.querySelectorAll('#<%= repDetalle.ClientID %> img');
            var timestamp = new Date().getTime();

            // Añadir el parámetro de cachebuster a cada URL de imagen
            repeaterImages.forEach(function (img) {
                var src = img.getAttribute('src');
                if (src) {
                    img.setAttribute('src', src.split('?')[0] + '?cachebuster=' + timestamp);
                }
            });
        }
        window.onload = function () {
            addCacheBusterToImages();
        };
        function replaceIfBroken(img) {
            if (!img.complete || img.naturalHeight === 0 || img.naturalWidth === 0) {
                img.src = 'https://simacolor.com.gt/sistema/files/articulos/no.png';
            }
        }


    </script>

</asp:Content>

