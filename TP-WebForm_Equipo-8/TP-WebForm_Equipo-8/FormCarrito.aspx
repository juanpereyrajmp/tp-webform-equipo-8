<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="FormCarrito.aspx.cs" Inherits="TP_WebForm_Equipo_8.FormCarrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="text-center mt-4">
        <h1>Carrito de compras</h1>
    </div>



    <section class="body-def contetiner">
        <%-- <div class="row row-cols-1 row-cols-md-3 g-4">--%>

        
        <asp:Label ID="lblError" runat="server" ForeColor="Red" />
        <asp:GridView ID="dgvCarrito" runat="server"
            AutoGenerateColumns="false"
            CssClass="table table-dark table-border"
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
                <asp:BoundField HeaderText="Precio Unidad" DataField="Precio" ReadOnly="true" />
                <%-- <asp:BoundField HeaderText="Cantidad" DataField="Cantidad"/> --%>
                <asp:TemplateField HeaderText="Cantidad">
                    <ItemTemplate>
                        <asp:Label ID="LabCarritoCant" runat="server" Text='<%# Eval("Cantidad") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCarritoCant" runat="server" Text='<%# Bind("Cantidad") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Total">
                    <ItemTemplate>
                        <%# (Convert.ToDecimal(Eval("Precio")) * Convert.ToInt32(Eval("Cantidad"))).ToString("C") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Link" ShowEditButton="true"
                    ShowDeleteButton="true" />

            </Columns>
        </asp:GridView>






        <%-- <asp:Repeater ID="repEliminar" runat="server">
                <ItemTemplate>
                    <div class="col">
                        <div class="card" style="width: 100%; margin: auto;">
                            <img src="<%# Eval("Imagen") %>" class="card-img-top" alt="..." style="height: 200px; object-fit: cover; margin: auto; width: auto;">
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
                                <asp:Button ID="btnEliminarDelCarrito" runat="server" Text="Eliminar" OnClick="btnEliminarDelCarrito_Click" CssClass="btn btn-danger" CommandArgument='<%# Eval("Id") %>' CommandName="ArticuloId" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>--%>
        <%--</div>--%>
    </section>

</asp:Content>
