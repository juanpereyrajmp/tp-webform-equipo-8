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
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            letter-spacing: 2px;
            display: inline-block;
        }

        .label-custom {
            font-size: 1.2em;
            margin-right: 15px;
        }

        .button-custom {
            margin-top: 10px;
        }
    </style>
        <script>
        function showAlert() {
            alert("Todavía no se puede comprar en esta página. Tené paciencia.");
        }
        </script>
    <div class="text-center mt-4">
        <h1 class="titulo">Carrito de compras</h1>
    </div>

    <section class="body-def contetiner">
        <%-- <div class="row row-cols-1 row-cols-md-3 g-4">--%>
        <asp:Label ID="lblError" runat="server" ForeColor="Red" />
        <asp:GridView ID="dgvCarrito" runat="server"
            AutoGenerateColumns="false"
            CssClass="table table-custom"
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
                <%-- <asp:BoundField HeaderText="Cantidad" DataField="Cantidad"/> --%>
                <asp:TemplateField HeaderText="Cantidad">
                    <ItemTemplate>
                        <asp:Label ID="LabCarritoCant" runat="server" Text='<%# Eval("Cantidad") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCarritoCant" runat="server" Text='<%# Bind("Cantidad") %>' CssClass="form-control" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Total">
                    <ItemTemplate>
                        <%# (Convert.ToDecimal(Eval("Precio")) * Convert.ToInt32(Eval("Cantidad"))).ToString("C") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn btn-primary btn-sm">
                    <i class="fas fa-edit"></i> Editar
                        </asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn btn-danger btn-sm">
                    <i class="fas fa-trash-alt"></i> Eliminar
                        </asp:LinkButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" CssClass="btn btn-success btn-sm">
                    <i class="fas fa-check"></i> Actualizar
                        </asp:LinkButton>
                        <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" CssClass="btn btn-secondary btn-sm">
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
    <div class="container">
        <div class="row justify-content-end">
            <div class="col-md-3 text-right">
                <asp:Label ID="LabTotalCantidad" runat="server" Text="" CssClass="font-weight-bold label-custom"></asp:Label>
            </div>
            <div class="col-md-3 text-right">
                <asp:Label ID="LabTotalPrecio" runat="server" Text="" CssClass="font-weight-bold label-custom"></asp:Label>
            </div>
            <div class="col-md-3 text-right">
                <asp:Button ID="Button1" runat="server" Text="Comprar" CssClass="btn btn-primary button-custom" OnClientClick="showAlert(); return false;"></asp:Button>
            </div>
        </div>
    </div>

</asp:Content>
