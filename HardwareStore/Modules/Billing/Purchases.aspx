﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Purchases.aspx.cs" Inherits="HardwareStore.Modules.Billing.Purchases" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-top: 10px;">
        <%-- Alert for transaction Info --%>
        <div id="section-alerts">
        </div>
        <%-- End Alert --%>
        <%-- Modals section... --%>

        <div class="modal fade" id="ventanaModal" tabindex="-1" role="dialog" aria-labelledby="tituloVentana" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-centered" role="document" style="min-width: 1300px;">
                <div class="modal-content">
                    <div class="modal-header bg-dark">
                        <h4 class="text-light">Existencias Productos</h4>
                        <%--<label runat="server" id="getidFromtable"></label>--%>
                        <button class="close text-light" data-dismiss="modal" aria-label="cerrar">
                            <span class="text-light" aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <asp:UpdatePanel runat="server" ID="updatePanelProductDetails">
                            <ContentTemplate>
                                <div class="form-row">
                                    <div class="col-md-4 mt-3">
                                        <input class="form-control" runat="server" id="txtSearchProductDetails" placeholder="Buscar..." />
                                    </div>
                                    <div class="col-md-4 mt-3 pl-3">
                                        <asp:Button CssClass="btn btn-primary" runat="server" Text="Buscar" ID="btnSearchProductDetails" />
                                    </div>
                                </div>
                                <div class="table-responsive mt-3">
                                    <asp:GridView runat="server" DataKeyNames="Code" AutoGenerateColumns="false"
                                        ID="GridViewProductDetails" OnRowCommand="GridViewProductDetails_RowCommand" CssClass="table table-hover" CellPadding="5">
                                        <HeaderStyle CssClass="thead-dark" />
                                        <Columns>
                                            <asp:BoundField HeaderText="Código" DataField="Code" />
                                            <asp:BoundField HeaderText="Producto" DataField="ProductName" />
                                            <asp:BoundField HeaderText="Unidad de medida" DataField="MeasureUnit" />
                                            <asp:BoundField HeaderText="Categoría" DataField="CategoryName" />
                                            <asp:BoundField HeaderText="Material" DataField="MaterialName" />
                                            <asp:BoundField HeaderText="Marca" DataField="BrandName" />
                                            <asp:BoundField HeaderText="Dimensiones" DataField="Dimensions" />
                                            <asp:BoundField HeaderText="Material" DataField="MaterialName" />
                                            <asp:BoundField HeaderText="Codigo fabrica" DataField="DefaultCode" />
                                            <asp:BoundField HeaderText="Fecha registro" DataField="CreatedAt" />
                                            <asp:BoundField HeaderText="Creado por" DataField="CreatedBy" />
                                            <asp:BoundField HeaderText="Estado" DataField="Status" />
                                            <asp:TemplateField HeaderText="Opciones">
                                                <ItemTemplate>
                                                    <asp:LinkButton Font-Size="11px" Height="28px" Width="80px"
                                                        CssClass="btn btn-primary btn-sm" ID="LinkSelect" ToolTip="Seleccionar Producto"
                                                        CommandName="cmdSelect" runat="server">Seleccionar</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="GridViewProductDetails" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>

        <%-- Modal confirmación eliminar --%>
        <div style="margin-top: 120px" class="modal fade" id="ConfirmDeletions" tabindex="-1" aria-labelledby="confirmDelete" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <asp:UpdatePanel runat="server" ID="UpdatePanelDeleteItem">
                        <ContentTemplate>
                            <div class="modal-header bg-info">
                                <h5 class="modal-title text-light" id="confirmDelete">Alerta!</h5>
                                <button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
                                    <span class="text-light" aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div id="modal-body-content" class="modal-body">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                                <asp:Button Text="Eliminar" runat="server" ID="btnConfirmDeleteProduct" OnClick="btnConfirmDeleteProduct_Click" CssClass="btn btn-warning" />
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <%-- Fin modal de confirmación --%>

        <%-- End Modals section --%>

        <%-- Main container or main view --%>
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-12 mx-auto">
                    <div class="card">
                        <div class="card-body">
                            <!-- Header of tabs -->
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <a class="nav-link" id="purchaselist-tab" data-toggle="tab" href="#purchaselist-content" role="tab" aria-controls="purchaselist-content" aria-selected="false">Historial de compras</a>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <a class="nav-link active" id="newpurchase-tab" data-toggle="tab" href="#newpurchase-content" role="tab" aria-controls="newpurchase-content" aria-selected="true">Nueva compra</a>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <a class="nav-link" id="purchasedetail-tab" data-toggle="tab" href="#purchasedetail-content" role="tab" aria-controls="purchasedetail-content" aria-selected="false">Detalle compra</a>
                                </li>
                            </ul>
                            <!-- end of headers (tabs) -->

                            <!-- Tabs content -->
                            <div class="tab-content" id="myTabContent">
                                <%-- purchases list --%>
                                <div class="tab-pane fade" id="purchaselist-content" role="tabpanel" aria-labelledby="purchaselist-tab">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelForInvoiceList">
                                        <ContentTemplate>
                                            <div class="row mt-3">
                                                <div class="col">
                                                    <div class="card card-shadow">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="card">
                                                                        <div class="card-body">
                                                                            <div class="form-row align-items-center">
                                                                                <div class="form-group col-md-4">
                                                                                    <asp:Label Text="Buscar" runat="server" />
                                                                                    <asp:TextBox runat="server" ID="txtSearchInvoiceRecords" CssClass="form-control" placeholder="Buscar..." />
                                                                                </div>
                                                                                <div class="form-group col-md-3">
                                                                                    <asp:Label Text="Fecha Inicio" runat="server" />
                                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="PickerStartDateInvoceFilter" TextMode="Date" />
                                                                                </div>
                                                                                <div class="form-group col-md-3">
                                                                                    <asp:Label Text="Fecha Final" runat="server" />
                                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="PickerEndDateInvoiceFilter" TextMode="Date" />
                                                                                </div>
                                                                                <div class="form-group col-md-2">
                                                                                    <br />
                                                                                    <asp:Button Text="Filtrar" runat="server" ID="btnInvoiceFilter" OnClick="btnInvoiceFilter_Click" CssClass="btn btn-primary btn-block" />
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mt-4">
                                                                <div class="col">
                                                                    <div class="card">
                                                                        <div class="card-body table-responsive mt-3 mb-3">
                                                                            <asp:GridView runat="server" DataKeyNames="Id" AutoGenerateColumns="false"
                                                                                ID="GridViewInvoices" CssClass="table" CellPadding="5" OnRowCommand="GridViewInvoices_RowCommand">
                                                                                <HeaderStyle CssClass="thead-dark" />
                                                                                <Columns>
                                                                                    <asp:BoundField HeaderText="Id" DataField="Id" Visible="false" />
                                                                                    <asp:BoundField HeaderText="No. Factura" DataField="InvoiceNumber" />
                                                                                    <asp:BoundField HeaderText="Proveedor" DataField="SupplierName" />
                                                                                    <asp:BoundField HeaderText="Factura proveedor" DataField="SupplierInvoiceNumber" />
                                                                                    <asp:BoundField HeaderText="Subtotal" DataField="Subtotal" />
                                                                                    <asp:BoundField HeaderText="IVA" DataField="Tax" />
                                                                                    <asp:BoundField HeaderText="Descuento" DataField="Discount" />
                                                                                    <asp:BoundField HeaderText="Total" DataField="TotalAmount" />
                                                                                    <asp:BoundField HeaderText="Fecha creación" DataField="CreationDate" />
                                                                                    <asp:BoundField HeaderText="Fecha actualización" DataField="UpdateDate" />
                                                                                    <asp:BoundField HeaderText="Realizada por" DataField="CreatedBy" />
                                                                                    <asp:TemplateField HeaderText="Opciones">
                                                                                        <ItemTemplate>
                                                                                            <asp:LinkButton Font-Size="11px" Height="28px" Width="80px"
                                                                                                CssClass="btn btn-primary btn-sm mb-3" ID="DetailsLink" ToolTip="Detalle de compra"
                                                                                                CommandName="cmdDetails" runat="server">Detalles</asp:LinkButton>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <%-- End list --%>

                                <%-- New Sale Section --%>
                                <div class="tab-pane fade show active" id="newpurchase-content" role="tabpanel" aria-labelledby="newpurchase-tab">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelForPurchaseDetail">
                                        <ContentTemplate>
                                            <div class="row mt-3">
                                                <div class="col-md-12">
                                                    <div class="card card-shadow">
                                                        <div class="card-body">
                                                            <asp:TextBox runat="server" ID="txtMeasureUnitId" ReadOnly="true" Visible="false" />
                                                            <asp:TextBox runat="server" ID="txtMeasureUnitTypeId" ReadOnly="true" Visible="false" />
                                                            <asp:TextBox runat="server" ID="txtProductCodeForDelete" ReadOnly="true" Visible="false" />
                                                            <asp:TextBox runat="server" ID="txtWarehouseId" ReadOnly="true" Visible="false" />

                                                            <div class="form-row">
                                                                <div class="form-group col-md-3">
                                                                    <label>Producto</label>
                                                                    <div class="input-group">
                                                                        <input type="text" readonly placeholder="Producto" runat="server" id="txtProductName" class="form-control form-disable">
                                                                        <div title="Elige un Producto" class="input-group-append">
                                                                            <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#ventanaModal">...</button>
                                                                        </div>
                                                                        <div title="Crea un nuevo Producto" class="input-group-append">
                                                                            <button class="btn btn-success btn-sm" onclick="launch_Toast_ItemAddedToTempList()" data-toggle="modal" data-target="#ModalnewProduct">+</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group col-md-3">
                                                                    <div style="margin-bottom: .5rem;">
                                                                        <asp:Label Text="Codigo" runat="server" />
                                                                    </div>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtProductDetailCode" ReadOnly="true" placeholder="Código" />
                                                                </div>
                                                                <div class="form-group col-md-3">
                                                                    <div class="d-flex justify-content-start">
                                                                        <label>Bodega</label>
                                                                    </div>
                                                                    <div class="input-group">
                                                                        <asp:DropDownList ID="ddlstWarehouses" CssClass="form-control" runat="server">
                                                                        </asp:DropDownList>
                                                                        <div class="input-group-append">
                                                                            <button data-toggle="modal" data-target="#ModalWarehause" class="btn btn-info btn-sm" type="button">+</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group col-md-3">
                                                                    <div style="margin-bottom: .5rem;">
                                                                        <asp:Label Text="Fecha expiración" runat="server" />
                                                                    </div>
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="pickerExpiryDate" TextMode="Date" placeholder="Fecha expiración" />
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="form-group col-md-3">
                                                                    <asp:Label Text="Marca" runat="server" />
                                                                    <div class="input-group">
                                                                        <asp:TextBox runat="server" ReadOnly="true" CssClass="form-control" ID="txtBrandName" placeholder="Marca" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group col-md-3">
                                                                    <asp:Label Text="Categoría" runat="server" />
                                                                    <div class="input-group">
                                                                        <asp:TextBox runat="server" ReadOnly="true" CssClass="form-control" ID="txtCategoryName" placeholder="Categoría" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group col-md-3">
                                                                    <asp:Label Text="Material" runat="server" />
                                                                    <div class="input-group">
                                                                        <asp:TextBox runat="server" ReadOnly="true" CssClass="form-control" ID="txtMaterialName" placeholder="Tipo de material" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group col-md-3">
                                                                    <asp:Label Text="Dimensiones" runat="server" />
                                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtDimensions" ReadOnly="true" placeholder="Dimensiones" />
                                                                </div>
                                                            </div>
                                                            <div class="form-row">
                                                                <div class="form-group col-md-3">
                                                                    <asp:Label Text="Unidad base" runat="server" />
                                                                    <div class="input-group">
                                                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtUnitMeasureBase" ReadOnly="true" placeholder="Unidad" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group col-md-3">
                                                                    <asp:Label Text="Cantidad" runat="server" />
                                                                    <div class="input-group">
                                                                        <div class="input-group-append">
                                                                            <span class="input-group-text">#</span>
                                                                        </div>
                                                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtQuantity" TextMode="Number" step="1" placeholder="Cantidad" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group col-md-3">
                                                                    <asp:Label Text="Precio compra" runat="server" />
                                                                    <div class="input-group">
                                                                        <div class="input-group-append">
                                                                            <span class="input-group-text">C$</span>
                                                                        </div>
                                                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtPurchasePrice" TextMode="Number" step="0.001" placeholder="Precio" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group col-md-3">
                                                                    <asp:Label Text="Impuesto" runat="server" />
                                                                    <div class="input-group">
                                                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtTaxDetail" TextMode="Number" step="0.001" placeholder="Impuesto" />
                                                                        <div class="input-group-append">
                                                                            <span class="input-group-text">IVA</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-row">
                                                                <div class="form-group col-md-3">
                                                                    <div style="margin-bottom: .5rem;">
                                                                        <asp:Label Text="Descuento" runat="server" />
                                                                    </div>
                                                                    <div class="input-group">
                                                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtDetailDiscount" TextMode="Number" step="1" placeholder="Descuento" />
                                                                        <div class="input-group-append">
                                                                            <span class="input-group-text">%</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group col-md-4">
                                                                    <label>Precio venta</label>
                                                                    <div class="input-group">
                                                                        <asp:DropDownList AutoPostBack="true" ID="ddlistValidateSalePrice" OnSelectedIndexChanged="ddlistValidateSalePrice_SelectedIndexChanged" CssClass="form-control" runat="server">
                                                                            <asp:ListItem Value="1" Text="Imponible por el sistema" />
                                                                            <asp:ListItem Value="2" Text="Digitado por el usuario" />
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group col-md-3">
                                                                    <div style="margin-bottom: .5rem;">
                                                                        <asp:Label Text="Precio venta" runat="server" />
                                                                    </div>
                                                                    <div class="input-group">
                                                                        <div class="input-group-append">
                                                                            <span class="input-group-text">C$</span>
                                                                        </div>
                                                                        <asp:TextBox runat="server" ReadOnly="true" CssClass="form-control" ID="txtSalePrice" TextMode="Number" step="0.001" placeholder="Precio venta" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card-footer">
                                                            <div class="row justify-content-center">
                                                                <div class="col-md-2 p-1">
                                                                    <asp:Button runat="server" Text="Agregar" ID="btnAddToPurchaseDetailList" OnClick="btnAddToPurchaseDetailList_Click" CssClass="btn btn-success btn-block" />
                                                                </div>
                                                                <div class="col-md-2 p-1">
                                                                    <asp:Button runat="server" Text="Cancelar" ID="btnCancelOrClearDetailForm" OnClick="btnCancelOrClearDetailForm_Click" CssClass="btn btn-warning btn-block" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <%--<asp:PostBackTrigger ControlID="btnAddToPurchaseDetailList" />--%>
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                                <%-- End Sale Section --%>

                                <%-- Detail Sale Section --%>
                                <div class="tab-pane fade" id="purchasedetail-content" role="tabpanel" aria-labelledby="purchasedetail-tab">
                                    <asp:UpdatePanel runat="server" ID="UpdatePanelForNewPurchase">
                                        <ContentTemplate>
                                            <div class="row mt-3">
                                                <div class="col">
                                                    <div class="card card-shadow">
                                                        <div class="card-header">
                                                            <div class="form-row">
                                                                <div class="form-group col-md-4">
                                                                    <div style="margin-bottom: .5rem;">
                                                                        <asp:Label Text="Factura" runat="server" />
                                                                    </div>
                                                                    <div class="input-group">
                                                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtSupplierInvoiceNumber" placeholder="Número de factura" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group col-md-4">
                                                                    <label for="txtCustomer">Proveedores</label>
                                                                    <div class="input-group">
                                                                        <asp:DropDownList ID="ddlstSuppliers" CssClass="form-control" runat="server">
                                                                        </asp:DropDownList>
                                                                        <div class="input-group-append">
                                                                            <button data-toggle="modal" data-target="#ModalSuppliers" class="btn btn-info btn-sm" type="button">+</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="table-responsive mt-3 mb-3">
                                                                <asp:GridView runat="server" DataKeyNames="Code, WarehouseId" AutoGenerateColumns="false"
                                                                    ID="GridViewPurchaseDetails" CssClass="table" CellPadding="5" OnRowCommand="GridViewPurchaseDetails_RowCommand">
                                                                    <HeaderStyle CssClass="thead-dark" />
                                                                    <Columns>
                                                                        <asp:BoundField HeaderText="Código" DataField="Code" />
                                                                        <asp:BoundField HeaderText="Bodega" DataField="WarehouseName" />
                                                                        <asp:BoundField HeaderText="Producto" DataField="ProductName" />
                                                                        <asp:BoundField HeaderText="Marca" DataField="BrandName" />
                                                                        <asp:BoundField HeaderText="Material" DataField="MaterialName" />
                                                                        <asp:BoundField HeaderText="Dimensiones" DataField="Dimensions" />
                                                                        <asp:BoundField HeaderText="Expiración" DataField="ExpiryDate" />
                                                                        <asp:BoundField HeaderText="Unidad" DataField="MeasureUnitBase" />
                                                                        <asp:BoundField HeaderText="Precio venta" DataField="SalePriceStr" />
                                                                        <asp:BoundField HeaderText="Precio compra" DataField="PurchasePriceStr" />
                                                                        <asp:BoundField HeaderText="Cantidad" DataField="Quantity" />
                                                                        <asp:BoundField HeaderText="Subtotal" DataField="SubtotalStr" />
                                                                        <asp:BoundField HeaderText="Discount" DataField="DiscountStr" />
                                                                        <asp:BoundField HeaderText="IVA" DataField="TaxStr" />
                                                                        <asp:BoundField HeaderText="Total" DataField="TotalStr" />
                                                                        <asp:TemplateField HeaderText="Opciones">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton Font-Size="11px" Height="28px" Width="80px"
                                                                                    CssClass="btn btn-primary btn-sm mb-3" ID="EditLink" ToolTip="Editar Producto"
                                                                                    CommandName="cmdEdit" runat="server">Editar</asp:LinkButton>
                                                                                <asp:LinkButton Font-Size="11px" Height="28px" Width="80px"
                                                                                    CssClass="btn btn-danger btn-sm" ID="DeleteLink" ToolTip="Eliminar Producto"
                                                                                    CommandName="cmdDelete" runat="server">Eliminar</asp:LinkButton>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-3">
                                                <div class="col">
                                                    <div class="card card-shadow">
                                                        <div class="card-body">
                                                            <div class="form-row">
                                                                <div class="form-group col-md-3">
                                                                    <label>Subtotal</label>
                                                                    <div class="input-group">
                                                                        <div class="input-group-prepend">
                                                                            <span class="input-group-text">C$</span>
                                                                        </div>
                                                                        <input readonly runat="server" id="txtSubtotal" placeholder="Subtotal" class="form-control" />
                                                                    </div>
                                                                </div>
                                                                <div class="form-group col-md-3">
                                                                    <label>Impuesto</label>
                                                                    <div class="input-group">
                                                                        <asp:TextBox runat="server" TextMode="Number" step="0.01" ID="txtTotalTax" placeholder="Impuesto" CssClass="form-control" />
                                                                        <div class="input-group-prepend">
                                                                            <span class="input-group-text">IVA</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group col-md-3">
                                                                    <label for="txtTotalDiscount">Descuento</label>
                                                                    <div class="input-group">
                                                                        <asp:TextBox TextMode="Number" runat="server" step="1" ID="txtTotalDiscount" placeholder="Descuento" CssClass="form-control" />
                                                                        <div class="input-group-prepend">
                                                                            <span class="input-group-text">%</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group col-md-3">
                                                                    <label>Total</label>
                                                                    <div class="input-group">
                                                                        <div class="input-group-prepend">
                                                                            <span class="input-group-text">C$</span>
                                                                        </div>
                                                                        <asp:TextBox runat="server" ReadOnly="true" ID="txtTotal" placeholder="Total" CssClass="form-control" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card-footer">
                                                            <div class="row justify-content-center">
                                                                <div class="col-md-2 p-1">
                                                                    <asp:Button runat="server" Text="Calcular" ID="btnRecalculatePurchaseTotal" OnClick="btnRecalculatePurchaseTotal_Click" CssClass="btn btn-success btn-block" />
                                                                </div>
                                                                <div class="col-md-2 p-1">
                                                                    <asp:Button runat="server" Text="Registrar Orden" ID="btnGeneratePurchase" OnClick="btnGeneratePurchase_Click" CssClass="btn btn-success btn-block" />
                                                                </div>
                                                                <div class="col-md-2 p-1">
                                                                    <asp:Button runat="server" Text="Cancelar" ID="btnPurchaseCancel" OnClick="btnPurchaseCancel_Click" CssClass="btn btn-danger btn-block" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <%--<asp:PostBackTrigger ControlID="btnGeneratePurchase" />--%>
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <%-- End Detail Sale --%>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <%-- End of Main container --%>

        <%-- start Toaster section --%>
        <div id="Toast_ItemAddedToTempList" class="toast">
            <div class="toast-img toast-img-success"><i class="fas fa-exclamation"></i></div>
            <div class="toast-body">
                <p style="text-align: justify;">
                    Producto agregado al detalle!
                </p>
            </div>
        </div>

        <div id="Toaster_ProductUpdated" class="toast">
            <div class="toast-img toast-img-success"><i class="fas fa-exclamation"></i></div>
            <div class="toast-body">
                <p style="text-align: justify;">
                    Producto actualizado correctamente!
                </p>
            </div>
        </div>

        <div id="Toast_ItemAreadyExist" class="toast">
            <div class="toast-img toast-img-danger"><i class="fas fa-exclamation"></i></div>
            <div class="toast-body">
                <p style="text-align: justify;">
                    El producto ya existe en la lista!
                <br />
                    Edite el existente en su lugar
                </p>
            </div>
        </div>
        <%-- End toaster section --%>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script>
        function launch_Toast_ItemAddedToTempList() {
            console.log("Hello World");
            var el = document.getElementById("Toast_ItemAddedToTempList")
            el.classList.add("show");
            setTimeout(function () { el.classList.remove("show") }, 5000);
        }

        function Toast_ItemAlreadyExists() {
            var el = document.getElementById("Toast_ItemAreadyExist")
            el.classList.add("show");
            setTimeout(function () { el.classList.remove("show") }, 5000);
        }

        function Toaster_ProductUpdated() {
            var el = document.getElementById("Toaster_ProductUpdated")
            el.classList.add("show");
            setTimeout(function () { el.classList.remove("show") }, 5000);
        }

        function ShowAlert(title, message, CssClass) {
            const div = document.getElementById("section-alerts");
            div.className = `alert alert-${CssClass} m-2 alert-dismissible fade show`;
            const contentMessage = document.createTextNode(message);
            const strong = document.createElement('strong');
            strong.style.marginRight = "10px";
            const contentTitle = document.createTextNode(title);
            strong.appendChild(contentTitle);
            div.appendChild(strong);
            div.appendChild(contentMessage);
            setTimeout(function () {
                document.getElementById("section-alerts").remove();
            }, 7000);
            console.log("showAlert")
            //<div class="alert alert-warning alert-dismissible fade show" role="alert">
            //      <strong>Holy guacamole!</strong> You should check in on some of those fields below.
            //<button type="button" class="close" data-dismiss="alert" aria-label="Close">
            //          <span aria-hidden="true">&times;</span>
            //      </button>
            //</div>
        }

        function ShowAlertInfo(message) {
            let element = document.getElementById("modal-body-content");
            let content = document.createTextNode(message);
            element.appendChild(content);
            $('#ConfirmDeletions').modal('show');
        }
    </script>
</asp:Content>
