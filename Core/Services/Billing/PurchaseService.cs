﻿using HardwareStore.Core.DTOs.Catalogs;
using HardwareStore.Core.Interfaces.Catalogs;
using HardwareStore.Core.Interfaces.Billing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HardwareStore.Core.DTOs;
using HardwareStore.Core.DTOs.Billing;
using HardwareStore.Core.Interfaces.ProductsAdmin;
using HardwareStore.Core.Entities.Billing;
using HardwareStore.Core.Entities.ProductsAdmin;

namespace HardwareStore.Core.Services.Billing
{
    public class PurchaseService : IPurchasesService
    {
        private readonly IProductsRepository _ProductsRepository;
        private readonly IWarehouseRepository _WarehouseRepository;
        private readonly ISuppliersRepository _SuppliersRepository;
        private readonly IPurchaseRepository _PurchaseRepository;
        private readonly IProductsStocksRepository _StocksRepository;

        public PurchaseService(IProductsRepository _ProductsRepository, IWarehouseRepository _WarehouseRepository, ISuppliersRepository _SuppliersRepository,
                               IPurchaseRepository _PurchaseRepository, IProductsStocksRepository _StocksRepository)
        {
            this._ProductsRepository = _ProductsRepository;
            this._WarehouseRepository = _WarehouseRepository;
            this._SuppliersRepository = _SuppliersRepository;
            this._PurchaseRepository = _PurchaseRepository;
            this._StocksRepository = _StocksRepository;
        }

        public ProductDetailsDto GetAProductDetail(string Code)
        {
            try
            {
                ProductDetailsDto dto = new ProductDetailsDto();
                dto = this._ProductsRepository.GetAProductDetail(Code);
                return dto;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public List<ProductDetailsDto> GetProductDetails(bool Deleted, string Search)
        {
            try
            {
                List<ProductDetailsDto> list = new List<ProductDetailsDto>();
                list = this._ProductsRepository.ListAllProductDetails(Deleted, Search);
                return list;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public List<SuppliersDropDto> GetSuppliersForDropDowns()
        {
            try
            {
                List<SuppliersDropDto> list = new List<SuppliersDropDto>();
                list = this._SuppliersRepository.ListSuppliersForDropDowns();
                return list;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public List<WarehousesDropDto> GetWarehousesForDropdowns()
        {
            try
            {
                List<WarehousesDropDto> list = new List<WarehousesDropDto>();
                list = this._WarehouseRepository.GetWarehousesForDropdownsList();
                return list;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public Response RegisterPurchaseTransaction(PurchaseTransacDto data)
        {
            try
            {
                int TotalProducts = 0;
                PurchaseInvoices Invoice; List<PurchaseDetails> Details;
                Invoice = this.MapPurchaseInvoice(data); Details = this.MapDetailsForInvoice(data);

                this._PurchaseRepository.CreateNewPurchase(Invoice);
                this._PurchaseRepository.CreatePurchaseDetails(Details);
                TotalProducts = this.RegisterStocksProducts(data);

                return new Response() { Title = "¡Compra registrada correctamente!", Message = "Se han registrado " + TotalProducts + " productos a las existencias", Success = true };
            }
            catch (Exception exc)
            {
                //throw exc;
                return new Response() { Title = "¡Error al registrar la compra!", Message = exc.Message, Success = false };
            }
        }

        private int RegisterStocksProducts(PurchaseTransacDto data)
        {
            try
            {
                ProductStocks product; List<DetailProductStocks> Details;
                product = this.MapProductStocks(data); Details = this.MapProductStocksDetails(data);

                this._StocksRepository.RegisterNewProductStocks(product);
                this._StocksRepository.RegisterProductStocksDetails(Details);
                return Details.Count;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        private PurchaseInvoices MapPurchaseInvoice(PurchaseTransacDto Invoice)
        {
            try
            {
                PurchaseInvoices invoices = new PurchaseInvoices()
                {
                    SupplierId = Invoice.SupplierId,
                    SupplierInvoiceNumber = Invoice.SupplierInvoiceNumber,
                    Tax = Invoice.Tax,
                    Subtotal = Invoice.Subtotal,
                    Discount = Invoice.Discount,
                    TotalAmount = Invoice.TotalAmount,
                    CreatedBy = Invoice.UserName
                };

                return invoices;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        private List<PurchaseDetails> MapDetailsForInvoice(PurchaseTransacDto Invoice)
        {
            try
            {
                List<PurchaseDetails> list = new List<PurchaseDetails>();
                List<TempPurchaseList> temp = new List<TempPurchaseList>();
                temp = Invoice.Details;
                foreach (TempPurchaseList row in temp)
                {
                    PurchaseDetails dt = new PurchaseDetails()
                    {
                        ProductDetailCode = row.Code,
                        WarehouseId = row.WarehouseId,
                        TargetUnitId = row.MeasureUnitBaseId,
                        Quantity = row.Quantity,
                        PurchasePrice = row.PurchasePrice,
                        Subtotal = row.Subtotal,
                        Tax = row.Tax,
                        Discount = row.Discount,
                        Total = row.Total
                    };
                    list.Add(dt);
                }

                return list;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        private ProductStocks MapProductStocks(PurchaseTransacDto prod)
        {
            try
            {
                ProductStocks product = new ProductStocks()
                {
                    SupplierId = prod.SupplierId,
                    Quantity = prod.TotalProducts,
                    TotalAmount = prod.TotalAmount,
                    CreatedBy = prod.UserName
                };

                return product;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        private List<DetailProductStocks> MapProductStocksDetails(PurchaseTransacDto Stock)
        {
            try
            {
                List<DetailProductStocks> list = new List<DetailProductStocks>();
                List<TempPurchaseList> Temp = new List<TempPurchaseList>();
                Temp = Stock.Details;
                foreach (TempPurchaseList row in Temp)
                {
                    DetailProductStocks prod = new DetailProductStocks()
                    {
                        ProductDetailCode = row.Code,
                        WarehouseId = row.WarehouseId,
                        TargetUnitId = row.TargetUnitId,
                        Quantity = row.Quantity,
                        PurchasePrice = row.PurchasePrice,
                        SalePrice = row.SalePrice,
                        ExpirationDate = row.ExpirationDate
                    };
                    list.Add(prod);
                }

                return list;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public List<InvoicesDto> GetPurhaseInvoices(DateTime StartDate, DateTime EndDate, string Search)
        {
            try
            {
                List<InvoicesDto> Invoices = new List<InvoicesDto>();
                Invoices = this._PurchaseRepository.GetPurhaseInvoices(StartDate, EndDate, Search);
                return Invoices;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }

        public List<InvoiceDetailsDto> GetPurchaseInvoiceDetails(int InvoiceId)
        {
            try
            {
                List<InvoiceDetailsDto> Details = new List<InvoiceDetailsDto>();
                Details = this._PurchaseRepository.GetPurchaseInvoiceDetails(InvoiceId);
                return Details;
            }
            catch (Exception exc)
            {

                throw exc;
            }
        }
    }
}
