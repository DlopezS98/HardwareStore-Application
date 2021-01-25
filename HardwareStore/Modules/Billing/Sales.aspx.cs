﻿using HardwareStore.Core.DTOs.Billing;
using HardwareStore.Core.DTOs.Catalogs;
using HardwareStore.Core.DTOs.ProductsAdmin;
using HardwareStore.Core.Interfaces;
using HardwareStore.Core.Interfaces.Billing;
using Ninject;
using Ninject.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HardwareStore.Modules.Billing
{
    public partial class Sales : PageBase
    {
        [Inject]
        public ISalesServices _SalesServices { get; set; }
        [Inject]
        public ICommonServices _CommonService { get; set; }
        public List<TempSaleList> TempList { get; set; }
        public string UserName;
        public string TempListKey = "SalesDetailsList";
        public string UserKey = "Current_Username";

        //public void PageConfiguration()
        //{
        //    GridView grid = new GridView();
        //    grid = this.GridViewProductStocks;
        //    DataGridViewColumn column = grid.Columns[2];
        //    column.AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
        //}
        private void LoadGridViewForTempList(List<TempSaleList> tempList = null)
        {
            List<TempSaleList> EmptyList = new List<TempSaleList>();
            if (tempList != null)
            {
                this.GridViewSaleDetails.DataSource = tempList;
                this.GridViewSaleDetails.DataBind();
            }
            else
            {
                if (Session[TempListKey] != null)
                {
                    this.TempList = Session[TempListKey] as List<TempSaleList>;
                    this.GridViewSaleDetails.DataSource = TempList;
                    this.GridViewSaleDetails.DataBind();
                }
                else
                {
                    this.GridViewSaleDetails.DataSource = EmptyList;
                    this.GridViewSaleDetails.DataBind();
                }
            }
        }

        public void LoadGridViewProductStocks(DateTime? Start, DateTime? End, string search = "")
        {
            List<ProductStocksDto> list = new List<ProductStocksDto>();
            if (Start != null && End != null)
            {
                list = this._SalesServices.ListProductStocks(search, true, (DateTime)Start, (DateTime)End);
                this.GridViewProductStocks.DataSource = list;
                this.GridViewProductStocks.DataBind();
            }
            else
            {
                DateTime StartDate = Convert.ToDateTime("1998-10-01");
                DateTime EndDate = DateTime.Now.AddDays(1);
                list = this._SalesServices.ListProductStocks(search, true, StartDate, EndDate);
                this.GridViewProductStocks.DataSource = list;
                this.GridViewProductStocks.DataBind();
            }
        }

        public void LoadGridViewStocksDetails(string LotNumber, string search = "", int? warehouseid = 0)
        {
            List<StocksDetailsDto> list = new List<StocksDetailsDto>();
            list = this._SalesServices.ListStocksDetails(LotNumber, search, (int)warehouseid);
            this.GridViewStocksDetails.DataSource = list;
            this.GridViewStocksDetails.DataBind();
        }

        public void LoadDropdownlistWarehouses()
        {
            List<WarehousesDropDto> list = new List<WarehousesDropDto>();
            list = this._SalesServices.ListWarehousesForDropDowns();
            this.DropDownListWarehousesFilter.DataSource = list;
            this.DropDownListWarehousesFilter.DataTextField = "Name";
            this.DropDownListWarehousesFilter.DataValueField = "Id";
            this.DropDownListWarehousesFilter.DataBind();

            this.DropDownListWarehousesFilter.Items.Insert(0, new ListItem("Seleccione una bodega", "0"));
        }

        public void LoadDropDownListMeasureUnits(int? TypeId = null)
        {
            List<MeasureUnitsDropDto> list = new List<MeasureUnitsDropDto>();
            if (TypeId != null)
                list = this._SalesServices.ListMeasureUnitForDropdownsByType((int)TypeId);

            this.ddlistMeasureUnits.DataSource = list;
            this.ddlistMeasureUnits.DataTextField = "Name";
            this.ddlistMeasureUnits.DataValueField = "Id";
            this.ddlistMeasureUnits.DataBind();

            this.ddlistMeasureUnits.Items.Insert(0, new ListItem("Selecciona la Unidad de medida", "0"));
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.LoadGridViewProductStocks(null, null);
                this.LoadDropdownlistWarehouses();
            }

            Session[UserKey] = "01dlopezs98@gmail.com";
            this.LoadGridViewForTempList();
        }

        protected void btnSearchProductStocks_Click(object sender, EventArgs e)
        {
            string search = txtSearchProductStocks.Text;
            DateTime Start = Convert.ToDateTime(PickerStartDateProductStocks.Text);
            DateTime End = Convert.ToDateTime(PickerEndDateProductStocks.Text);

            this.LoadGridViewProductStocks(Start, End, search);
        }

        protected void GridViewProductStocks_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow Row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            int index = Row.RowIndex;
            string lotnumber = Convert.ToString(GridViewProductStocks.DataKeys[index]["LotNumber"]);
            string ShowModal = string.Format("ShowModalStocksDetails('{0}')", lotnumber);
            switch (e.CommandName)
            {
                case "cmdShowStocksDetail":
                    txtLotNumberForStockDetails.Text = lotnumber;
                    this.LoadGridViewStocksDetails(lotnumber);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ShowModal, true);
                    break;

                default:
                    break;
            }
        }

        protected void btnSearchStocksDetails_Click(object sender, EventArgs e)
        {
            string lotnumber = txtLotNumberForStockDetails.Text;
            string search = txtSearchStocksDetails.Text;
            int warehouseid = Convert.ToInt32(DropDownListWarehousesFilter.SelectedValue);

            this.LoadGridViewStocksDetails(lotnumber, search, warehouseid);
        }

        protected void DropDownListWarehousesFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            string lotnumber = txtLotNumberForStockDetails.Text;
            int warehouseid = Convert.ToInt32(DropDownListWarehousesFilter.SelectedValue);
            this.LoadGridViewStocksDetails(lotnumber, warehouseid: warehouseid);
        }

        protected void GridViewStocksDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow Row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            int index = Row.RowIndex;
            string lotnumber = Convert.ToString(GridViewStocksDetails.DataKeys[index]["LotNumber"]);
            string stockscode = Convert.ToString(GridViewStocksDetails.DataKeys[index]["StocksCode"]);
            switch (e.CommandName)
            {
                case "cmdSelect":
                    this.SendProductStocksDetailToTextbox(stockscode);
                    break;

                default:
                    break;
            }
        }

        private void SendProductStocksDetailToTextbox(string Code)
        {
            StocksDetailsDto dto = this._SalesServices.GetAStocksDetail(Code);
            this.LoadDropDownListMeasureUnits(dto.UnitTypeId);
            //Hidden Fields
            txtMeasureUnitBaseId.Text = dto.UnitBaseId.ToString();
            txtMeasureUnitPurchasedId.Text = dto.PurchaseUnitId.ToString();
            txtMeasureUnitTypeId.Text = dto.UnitTypeId.ToString();
            txtWarehouseId.Text = dto.WarehouseId.ToString();

            //Other Fields
            txtLotNumber.Text = dto.LotNumber;
            txtSupplierName.Text = dto.SupplierName;
            txtStocksCode.Text = dto.StocksCode;
            txtProductName.Text = dto.ProductName;
            txtProductDetailCode.Text = dto.ProductDetailCode;
            txtExpiryDate.Text = dto.ExpirationDate;
            txtWarehouseName.Text = dto.WarehouseName;
            txtBrandName.Text = dto.BrandName;
            txtCategoryName.Text = dto.CategoryName;
            txtMaterialName.Text = dto.MaterialName;
            txtDimensions.Text = dto.Dimensions;
            txtInitialsStocks.Text = dto.StocksQuantity.ToString();
            SpanForInitialsStocks.InnerText = dto.PurchaseUnitName;
            txtCurrentStocks.Text = dto.ConversionValue.ToString();
            SpanForCurrentStocks.InnerText = dto.UnitBaseName;
            txtSalePrice.Text = dto.SalePrice.ToString();
            txtSalePriceByUnitBase.Text = dto.SalePriceByUnitBase.ToString();
        }

        protected void btnAddToSaleDetailsList_Click(object sender, EventArgs e)
        {
            string Option = btnAddToSaleDetailsList.Text;
            switch (Option)
            {
                case "Agregar":
                    this.AddItemToTempList();
                    break;

                case "Editar":
                    this.EditItemFromTempList();
                    break;

                default:
                    break;
            }
        }

        private void EditItemFromTempList()
        {
            double conversion;
            string StocksCode, ShowToaster;
            conversion = 0;
            StocksCode = txtStocksCode.Text;
            this.TempList = Session[TempListKey] as List<TempSaleList>;
            TempSaleList temp = this.TempList.FirstOrDefault(x => x.StocksCode == StocksCode);
            temp.Quantity = Convert.ToInt32(txtQuantity.Text);
            temp.Tax = Convert.ToDouble(txtDetailTax.Text);
            temp.Discount = Convert.ToInt32(txtDetailDiscount.Text);

            temp.SaleUnitId = Convert.ToInt32(ddlistMeasureUnits.SelectedValue);
            temp.SaleUnitName = ddlistMeasureUnits.SelectedItem.Text;
            conversion = this._CommonService.GetConversionValue(temp.PurchasedUnitId, temp.SaleUnitId, null);
            temp.SalePrice = temp.PurchasedPrice / conversion;
            temp.ConversionToUpdate = this._CommonService.GetConversionValue(temp.SaleUnitId, temp.UnitBaseId, temp.Quantity);

            ShowToaster = "ShowToaster('Producto actualizado!', 'success')";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ShowToaster, true);

            this.LoadGridViewForTempList(TempList);
            this.ResetInputsForSalesDetail();
            //this.calculateTotalAmount();
        }

        private void AddItemToTempList()
        {
            bool AlreadyExist;
            string ShowToaster;
            int idconvertfrom = Convert.ToInt32(ddlistMeasureUnits.SelectedValue);
            int idconvertto = Convert.ToInt32(txtMeasureUnitBaseId.Text);
            int quantity = Convert.ToInt32(txtQuantity.Text);
            double value = this._CommonService.GetConversionValue(idconvertfrom, idconvertto, quantity);
            double stocks = Convert.ToDouble(txtCurrentStocks.Text);
            if (value > stocks)
            {
                //no add
                ShowToaster = "ShowToaster('Cantidad no disponible <br/>en las existencias!', 'warning')";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ShowToaster, true);
            }
            else
            {
                TempSaleList Temp = this.CreateObjectForTempList();
                if (Session[TempListKey] == null)
                {
                    ShowToaster = "ShowToaster('Producto agregado a lista!', 'success')";
                    TempList = new List<TempSaleList>();
                    TempList.Add(Temp); Session[TempListKey] = TempList;
                    this.ResetInputsForSalesDetail();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ShowToaster, true);
                }
                else
                {
                    ShowToaster = "ShowToaster('El producto ya existe en la lista!', 'info')";
                    TempList = Session[TempListKey] as List<TempSaleList>;
                    AlreadyExist = TempList.Exists(x => x.StocksCode == Temp.StocksCode);
                    if (!AlreadyExist) { TempList.Add(Temp); this.ResetInputsForSalesDetail(); } else { ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ShowToaster, true); }
                }

                this.LoadGridViewForTempList(TempList);
                //this.calculateTotalAmount();
            }

        }

        private TempSaleList CreateObjectForTempList()
        {
            double conversion = 0;
            TempSaleList temp = new TempSaleList();
            temp.LotNumber = txtLotNumber.Text;
            temp.StocksCode = txtStocksCode.Text;
            temp.SupplierName = txtSupplierName.Text;
            temp.ProductName = txtProductName.Text;
            temp.ProductDetailCode = txtProductDetailCode.Text;
            temp.ExpirationDate = txtExpiryDate.Text;
            temp.WarehouseId = Convert.ToInt32(txtWarehouseId.Text);
            temp.WarehouseName = txtWarehouseName.Text;
            temp.BrandName = txtBrandName.Text;
            temp.CategoryName = txtCategoryName.Text;
            temp.MaterialName = txtMaterialName.Text;
            temp.Dimensions = txtDimensions.Text;
            temp.Quantity = Convert.ToInt32(txtQuantity.Text);
            temp.Tax = Convert.ToDouble(txtDetailTax.Text);
            temp.Discount = Convert.ToInt32(txtDetailDiscount.Text);

            temp.UnitTypeId = Convert.ToInt32(txtMeasureUnitTypeId.Text);

            temp.PurchasedUnitId = Convert.ToInt32(txtMeasureUnitPurchasedId.Text);
            temp.PurchaseUnitName = SpanForInitialsStocks.InnerText;
            temp.StocksQuantity = Convert.ToDouble(txtInitialsStocks.Text);
            temp.PurchasedPrice = Convert.ToDouble(txtSalePrice.Text);

            temp.UnitBaseId = Convert.ToInt32(txtMeasureUnitBaseId.Text);
            temp.UnitBaseName = SpanForCurrentStocks.InnerText;
            temp.UnitBaseStocks = Convert.ToDouble(txtCurrentStocks.Text);
            temp.SalePriceByUnitBase = Convert.ToDouble(txtSalePriceByUnitBase.Text);

            temp.SaleUnitId = Convert.ToInt32(ddlistMeasureUnits.SelectedValue);
            temp.SaleUnitName = ddlistMeasureUnits.SelectedItem.Text;
            conversion = this._CommonService.GetConversionValue(temp.PurchasedUnitId, temp.SaleUnitId, null);
            temp.SalePrice = temp.PurchasedPrice / conversion;

            temp.ConversionToUpdate = this._CommonService.GetConversionValue(temp.SaleUnitId, temp.UnitBaseId, temp.Quantity);

            return temp;
            //throw new NotImplementedException();
        }

        private void ResetInputsForSalesDetail()
        {
            txtMeasureUnitBaseId.Text = "";
            txtMeasureUnitPurchasedId.Text = "";
            txtMeasureUnitTypeId.Text = "";
            txtWarehouseId.Text = "";
            txtLotNumber.Text = "";
            txtSupplierName.Text = "";
            txtStocksCode.Text = "";
            txtProductName.Text = "";
            txtProductDetailCode.Text = "";
            txtExpiryDate.Text = "";
            txtWarehouseName.Text = "";
            txtBrandName.Text = "";
            txtCategoryName.Text = "";
            txtMaterialName.Text = "";
            txtDimensions.Text = "";
            txtInitialsStocks.Text = "";
            SpanForInitialsStocks.InnerText = "";
            txtCurrentStocks.Text = "";
            SpanForCurrentStocks.InnerText = "";
            txtSalePrice.Text = "";
            txtSalePriceByUnitBase.Text = "";
            ddlistMeasureUnits.SelectedIndex = 0;
            txtQuantity.Text = "";
            txtDetailTax.Text = "";
            txtDetailDiscount.Text = "";
            btnAddToSaleDetailsList.Text = "Agregar";
            this.LoadDropDownListMeasureUnits(null);
        }

        protected void btnCancelOrClearDetailForm_Click(object sender, EventArgs e)
        {
            this.ResetInputsForSalesDetail();
        }

        private void calculateTotalAmount()
        {
            throw new NotImplementedException();
        }

        protected void GridViewSaleDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow Row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            int Index = Row.RowIndex;
            string Code = Convert.ToString(GridViewSaleDetails.DataKeys[Index]["StocksCode"]);
            string ShowModal = string.Format("ShowAlertInfo('¿Estás seguro de querer eliminar el producto de la lista?')");
            switch (e.CommandName)
            {
                case "cmdEdit":
                    this.SendElementsToTextboxFromTempList(Code);
                    this.btnAddToSaleDetailsList.Text = "Editar";
                    break;
                case "cmdDelete":
                    txtStocksCodeDelete.Text = Code;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", ShowModal, true);
                    break;
                default:
                    break;
            }
        }

        private void SendElementsToTextboxFromTempList(string Code)
        {
            this.TempList = Session[TempListKey] as List<TempSaleList>;
            TempSaleList temp = this.TempList.FirstOrDefault(x => x.StocksCode == Code);
            this.LoadDropDownListMeasureUnits(temp.UnitTypeId);
            txtMeasureUnitBaseId.Text = temp.UnitBaseId.ToString();
            txtMeasureUnitPurchasedId.Text = temp.PurchasedUnitId.ToString();
            txtMeasureUnitTypeId.Text = temp.UnitTypeId.ToString();
            txtWarehouseId.Text = temp.WarehouseId.ToString();

            //Other Fields
            txtLotNumber.Text = temp.LotNumber;
            txtSupplierName.Text = temp.SupplierName;
            txtStocksCode.Text = temp.StocksCode;
            txtProductName.Text = temp.ProductName;
            txtProductDetailCode.Text = temp.ProductDetailCode;
            txtExpiryDate.Text = temp.ExpirationDate;
            txtWarehouseName.Text = temp.WarehouseName;
            txtBrandName.Text = temp.BrandName;
            txtCategoryName.Text = temp.CategoryName;
            txtMaterialName.Text = temp.MaterialName;
            txtDimensions.Text = temp.Dimensions;
            txtInitialsStocks.Text = temp.StocksQuantity.ToString();
            SpanForInitialsStocks.InnerText = temp.PurchaseUnitName;
            txtCurrentStocks.Text = temp.UnitBaseStocks.ToString();
            SpanForCurrentStocks.InnerText = temp.UnitBaseName;
            txtSalePrice.Text = temp.PurchasedPrice.ToString();
            txtSalePriceByUnitBase.Text = temp.SalePriceByUnitBase.ToString();
            ddlistMeasureUnits.SelectedValue = temp.SaleUnitId.ToString();
            txtQuantity.Text = temp.Quantity.ToString();
            txtDetailTax.Text = temp.Tax.ToString();
            txtDetailDiscount.Text = temp.Discount.ToString();
        }

        protected void btnConfirmDeleteProduct_Click(object sender, EventArgs e)
        {
            string Code = txtStocksCodeDelete.Text;
            this.TempList = Session[TempListKey] as List<TempSaleList>;
            TempSaleList temp = this.TempList.FirstOrDefault(x => x.StocksCode == Code);
            TempList.Remove(temp);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "$('#ConfirmDeletions').modal('hide')", true);
            this.LoadGridViewForTempList(TempList);
            this.ResetInputsForSalesDetail();
            //this.calculateTotalAmount();
        }

        protected void DropDownListCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}