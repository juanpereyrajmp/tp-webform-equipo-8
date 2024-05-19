<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="FormCarrito.aspx.cs" Inherits="TP_WebForm_Equipo_8.FormCarrito" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <style>
        .titulo {
            text-align: center;
            margin: 20px 0;
            padding: 5px 10px;
            color: black;
            font-size: 35px;
        }

        .label-custom {
            font-size: 20px;
            font-weight: bolder;
            margin-right: 15px;
        }

        .textbox-small {
            width: 50px;
            display: inline-block;
        }

        .table-custom {
            width: 100%;
            color: #212529;
            border-collapse: collapse;
            
        }


            .table-custom th, .table-custom td {
                padding: 0.75rem;
                vertical-align: top;
                border-top: 1px solid #dee2e6;
            }

            .table-custom thead th {
                vertical-align: bottom;
                border-bottom: 2px solid #dee2e6;
                background-color: #f8f9fa;
            }

            .table-custom tbody + tbody {
                border-top: 2px solid #dee2e6;
            }

            .table-custom .form-control {
                width: auto;
                display: inline-block;
            }

        .btn-customDelete {
            background-color: white;
            color: #E24F3B;
            border-radius: 10px;
            border: solid 2px #E24F3B;
        }

            .btn-customDelete:hover {
                background-color: #E24F3B;
                border: solid 2px white;
                color: white;
            }

        .btn-customEdit {
            background-color: white;
            color: #29ABE2;
            border-radius: 10px;
            border: solid 2px #29ABE2;
        }

            .btn-customEdit:hover {
                background-color: #29ABE2;
                border: solid 2px white;
                color: white;
            }

        .btn-customUpdate {
            background-color: white;
            color: #1DB954;
            border-radius: 10px;
            border: solid 2px #1DB954;
        }

            .btn-customUpdate:hover {
                background-color: #1DB954;
                border: solid 2px white;
                color: white;
            }

        .btn-customCancel {
            background-color: white;
            color: #898C8A;
            border-radius: 10px;
            border: solid 2px #898C8A;
        }

            .btn-customCancel:hover {
                background-color: #898C8A;
                border: solid 2px white;
                color: white;
            }

        .btn-customComprar {
            background-color: white;
            color: #7bc947;
            border-radius: 10px;
            border: solid 2px #7bc947;
            width: 100%;
        }

            .btn-customComprar:hover {
                background-color: #7bc947;
                border: solid 2px white;
                color: white;
            }
    </style>
    <script>
        function showAlert() {
            alert("Todavía no se puede comprar en esta página. Tené paciencia.");
        }
    </script>
    <div class="text-center mt-4">
        <p class="titulo">Carrito de compras</p>
    </div>

    <section class="body-def container">
        <asp:Label ID="lblError" runat="server" ForeColor="Red" />
        <asp:GridView ID="dgvCarrito" runat="server"
            AutoGenerateColumns="false"
            CssClass="table table-striped table-hover"
            OnRowCancelingEdit="dgvCarrito_RowCancelingEdit"
            OnRowDeleting="dgvCarrito_RowDeleting"
            OnRowEditing="dgvCarrito_RowEditing"
            OnRowUpdating="dgvCarrito_RowUpdating"
            DataKeyNames="Id">
            <Columns>
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" ReadOnly="true" />
                <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" ReadOnly="true" />
                <asp:BoundField HeaderText="Marca" DataField="Marca" ReadOnly="true" />
                <asp:BoundField HeaderText="Categoria" DataField="Categoria" ReadOnly="true" />
                <asp:BoundField HeaderText="Precio Unidad" DataField="Precio" ReadOnly="true" DataFormatString="${0:N2}" HtmlEncode="False" />
                <asp:TemplateField HeaderText="Cantidad">
                    <ItemTemplate>
                        <asp:Label ID="LabCarritoCant" runat="server" Text='<%# Eval("Cantidad") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCarritoCant" runat="server" Text='<%# Bind("Cantidad") %>' CssClass="form-control textbox-small" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Total">
                    <ItemTemplate>
                        <%# (Convert.ToDecimal(Eval("Precio")) * Convert.ToInt32(Eval("Cantidad"))).ToString("C") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn btn-customEdit btn-sm">
                        <i class="fas fa-edit"></i> Editar
                        </asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn btn-customDelete btn-sm">
                        <i class="fas fa-trash-alt"></i> Eliminar
                        </asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" CssClass="btn btn-customUpdate btn-sm">
                        <i class="fas fa-check"></i> Actualizar
                        </asp:LinkButton>
                        <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" CssClass="btn btn-customCancel btn-sm">
                        <i class="fas fa-times"></i> Cancelar
                        </asp:LinkButton>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </section>
    <%--<asp:Label ID="LabTotalCantidad" runat="server" Text="Label" OnLoad="Page_Load"></asp:Label>
    <asp:Label ID="LabTotalPrecio" runat="server" Text="Label"></asp:Label>
    <asp:Button ID="Button1" runat="server" Text="Button" />--%>
    <% if (carritoLleno)
        { %>
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-5 text-center">
                <asp:Label ID="LabTotalCantidad" runat="server" Text="" CssClass="font-weight-bold label-custom"></asp:Label>
            </div>
            <div class="col-md-5 text-center">
                <asp:Label ID="LabTotalPrecio" runat="server" Text="" CssClass="font-weight-bold label-custom"></asp:Label>
            </div>
        </div>
        <div class="row justify-content-center mt-4">
            <div class="col-md-2 text-center">
                <asp:Button ID="Button1" runat="server" Text="Comprar" CssClass="btn btn-customComprar" OnClick="Button1_Click" />
            </div>
        </div>
    </div>
    <% } %>
</asp:Content>
