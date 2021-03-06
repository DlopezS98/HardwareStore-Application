﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="HardwareStore.Modules.Catalogs.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-sm mt-4">
        <div class="row">
            <div class="col-lg-12 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <!-- Header of tabs -->
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="new-tab" data-toggle="tab" href="#new-content" role="tab" aria-controls="new-content" aria-selected="false">Nueva Categoria</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list-content" role="tab" aria-controls="list-content" aria-selected="true">Lista de Categorías</a>
                            </li>
                        </ul>
                        <%-- End Headers of tabs --%>

                        <%-- Start tabs content --%>
                        <div class="tab-content" id="myTabContent">
                            <%-- New product section --%>
                            <div class="tab-pane fade" id="new-content" role="tabpanel" aria-labelledby="new-tab">
                                <asp:UpdatePanel runat="server" ID="UpdatePanelForNew">
                                    <ContentTemplate>
                                        <div class="row mt-3">
                                            <div class="col">
                                                <div class="card card-shadow">
                                                    <div class="card-body">
                                                        <div class="row d-flex justify-content-center">
                                                            <div class="col-lg-6">
                                                                <div class="card">
                                                                    <div class="card-body">
                                                                        <div class="d-flex justify-content-center">
                                                                            <div class="w-100 bg-white rounded">
                                                                                <div class="form-row">
                                                                                    <div class="col-lg-12">
                                                                                        <label style="float: left; margin-left: 5px;">Nombre</label>
                                                                                        <div class="input-group">
                                                                                            <input runat="server" type="text" name="Type" id="txtNameCategories" class="form-control" />
                                                                                            <asp:RequiredFieldValidator Font-Size="10" ForeColor="Red" runat="server" ID="RequiredFieldValidator10" ValidationGroup="DetailsGroup" ControlToValidate="txtNameCategories">
                                                                                            <div class="ctrlvalidate">
                                                                                                <div style="color: #fff">
                                                                                                    Campo requerido  
                                                                                                 </div>
                                                                                                <div class="fas fa-sort-down position-absolute"></div>
                                                                                            </div>                                                      
                                                                                            </asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-lg-12">
                                                                                        <div class="form-group">
                                                                                            <label for="description">Descripción</label>
                                                                                            <textarea style="max-height: 100px; min-height: 50px" class="form-control" id="description" rows="3"></textarea>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer">
                                                        <div class="row justify-content-center">
                                                            <div class="col-lg-2 p-1">
                                                                <asp:Button ValidationGroup="DetailsGroup" runat="server" Text="Agregar" CssClass="btn btn-success btn-block" />
                                                            </div>
                                                            <div class="col-lg-2 p-1">
                                                                <asp:Button runat="server" Text="Cancelar" CssClass="btn btn-warning btn-block" />
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
                            <%-- End new product section --%>

                            <%-- Product list --%>
                            <div class="tab-pane fade show active" id="list-content" role="tabpanel" aria-labelledby="list-tab">
                                <asp:UpdatePanel runat="server" ID="UpdatePanelList">
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
                                                                            <div class="form-group col-lg-4">
                                                                                <asp:Label Text="Buscar" runat="server" />
                                                                                <asp:TextBox runat="server" ID="txtSearchInvoiceRecords" CssClass="form-control" placeholder="Buscar..." />
                                                                            </div>
                                                                            <div class="form-group col-lg-3">
                                                                                <asp:Label Text="Fecha Inicio" runat="server" />
                                                                                <asp:TextBox runat="server" CssClass="form-control" ID="PickerStartDateFilter" TextMode="Date" />
                                                                            </div>
                                                                            <div class="form-group col-lg-3">
                                                                                <asp:Label Text="Fecha Final" runat="server" />
                                                                                <asp:TextBox runat="server" CssClass="form-control" ID="PickerEndDateFilter" TextMode="Date" />
                                                                            </div>
                                                                            <div class="form-group col-lg-2">
                                                                                <br />
                                                                                <asp:Button Text="Filtrar" runat="server" ID="btnProductFilter" CssClass="btn btn-primary btn-block" />
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
                                                                        <asp:GridView runat="server" DataKeyNames="Code" AutoGenerateColumns="false"
                                                                            ID="GridViewCategories" CssClass="table table-hover" CellPadding="5">
                                                                            <HeaderStyle CssClass="thead-dark" />
                                                                            <Columns>
                                                                                <asp:BoundField HeaderText="Código" />
                                                                                <asp:BoundField HeaderText="Nombre" />
                                                                                <asp:BoundField HeaderText="Iniciales" />
                                                                                <asp:BoundField HeaderText="Descripcion" />
                                                                                <asp:BoundField HeaderText="Creado en" />
                                                                                <asp:BoundField HeaderText="Actualizado en" />
                                                                                <asp:BoundField HeaderText="Eliminado" />
                                                                                <asp:TemplateField HeaderText="Opciones">
                                                                                    <ItemTemplate>
                                                                                        <asp:Button Text="Editar" runat="server" CssClass="btn btn-primary" />
                                                                                        <asp:Button Text="Eliminar" runat="server" CssClass="btn btn-danger" />
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
                        </div>
                        <%-- End tabs content --%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
