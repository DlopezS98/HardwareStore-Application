﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UnitConversions.aspx.cs" Inherits="HardwareStore.Modules.Catalogs.UnitConversions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background: #fff" class="p-3">
        <asp:MultiView ID="mtvContenedor" runat="server" ActiveViewIndex="0">
            <asp:View ID="vVista0" runat="server">
                <div class="d-flex justify-content-center">
                    <div class="w-50 mt-5 shadow bg-white rounded p-3">
                        <div class="mt-2 mr-2" style="float: right">
                            <asp:Button ID="BtnUnitTodos" OnClick="BtnUnitTodos_Click" Text="Ver Todos" runat="server" CssClass="btn btn-primary" />
                        </div>
                        <div style="text-align: center; margin: 10px;">
                            <h2>Nueva Unidad de Medida</h2>
                        </div>
                        <div class="form-row mt-5">
                            <div class="col-md-5">
                                <label style="float: left; margin-left: 5px;">Tipo de Unidad</label>
                                <div style="display: inline-flex; float: left; width: 100%">
                                    <asp:DropDownList CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Seleccionar--" />
                                        <asp:ListItem Text="..." />
                                        <asp:ListItem Text="..." />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <label style="float: left; margin-left: 5px;">Nombre</label>
                                <input runat="server" type="text" name="Type" id="Text2" class="form-control" />
                            </div>
                            <div class="col-md-2">
                                <label style="float: left; margin-left: 5px;">Abreviación</label>
                                <input runat="server" type="text" name="Type" id="Text3" class="form-control" />
                            </div>
                            <div class="col-md-12">
                                <label style="float: left; margin-left: 5px;">Decripción</label>
                                <input runat="server" type="text" name="Type" id="Text1" class="form-control" />
                            </div>
                        </div>
                        <div style="width: 100%; margin: 20px; min-width: 150px; text-align: center">
                            <asp:Button ID="btnCancelar" OnClick="btnCancelar_Click" Text="Cancelar" runat="server" CssClass="btn btn-danger" />
                            <asp:Button Text="Guardar" runat="server" CssClass="btn btn-success" />
                        </div>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="vVista1" runat="server">
                <div class="mt-4 p-3">
                    <div class="d-flex justify-content-center">
                        <div class="w-75 mt-5 shadow bg-white rounded p-2">
                            <div style="text-align: center">
                                <h4>Catálogo Unidades de Medidas</h4>
                            </div>
                            <div class="form-row mt-5">
                                <div class="col-md-6">
                                    <asp:TextBox CssClass="form-control" runat="server" ID="txtSearch" placeholder="Buscar..." />
                                </div>
                                <div class="col-md-6 pl-3" style="margin-top: 0px">
                                    <asp:Button CssClass="btn btn-primary" runat="server" Text="Buscar" ID="btnSearch" />
                                </div>
                            </div>
                            <%-- Tabla --%>
                            <div style="max-width: 820px; overflow-x: scroll; display: inline-block; min-width: 180px; max-height: 250px; overflow-y: scroll" class="TableContainer mt-2 col-md-12">
                                <table class="table">
                                    <asp:GridView runat="server" DataKeyNames="Code" AutoGenerateColumns="false"
                                        ID="GridViewCategories" CssClass="table table-hover" CellPadding="5">
                                        <HeaderStyle CssClass="thead-dark" />
                                        <Columns>
                                            <asp:BoundField HeaderText="ID" />
                                            <asp:BoundField HeaderText="Tipo de Unidad" />
                                            <asp:BoundField HeaderText="Nombre" />
                                            <asp:BoundField HeaderText="Codigo" />
                                            <asp:BoundField HeaderText="Descripción" />
                                            <asp:BoundField HeaderText="Unidad Base" />
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
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
