<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="FormCarrito.aspx.cs" Inherits="TP_WebForm_Equipo_8.FormCarrito" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/Styles/estilos-carrito.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <!-- Titulo -->
    <div class="text-center mt-4">
        <p class="titulo">Carrito de compras</p>
    </div>

    <!-- Tabla -->
    <section class="body-def container">
        <asp:GridView ID="dgvCarrito" runat="server"
            AutoGenerateColumns="false"
            CssClass="table table-striped table-hover"
            OnRowCancelingEdit="dgvCarrito_RowCancelingEdit"
            OnRowDeleting="dgvCarrito_RowDeleting"
            OnRowEditing="dgvCarrito_RowEditing"
            OnRowUpdating="dgvCarrito_RowUpdating"
            DataKeyNames="Id" OnRowCommand="dgvCarrito_RowCommand">
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
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnIncrementar" Style="margin-left: 20px; width: 30px; height: 30px; align-content: center; align-items: center;" runat="server" Text="+" CommandName="Incrementar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-customIncrementar btn-sm" />
                        <asp:Button ID="btnDecrementar" Style="width: 30px; height: 30px; align-content: center; align-items: center;" runat="server" Text="-" CommandName="Decrementar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-customDecrementar btn-sm" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Total">
                    <ItemTemplate>
                        <%# (Convert.ToDecimal(Eval("Precio")) * Convert.ToInt32(Eval("Cantidad"))).ToString("C") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-customEliminar btn-sm" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </section>

    <!-- Totales -->
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
