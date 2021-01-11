//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HardwareStore.Infrastructure.Identity.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class SalesDetails
    {
        public int SaleInvoiceId { get; set; }
        public string ProductDetailCode { get; set; }
        public int WarehouseId { get; set; }
        public int TargetUnitId { get; set; }
        public int UnitConversionId { get; set; }
        public int Quantity { get; set; }
        public double Price { get; set; }
        public double Subtotal { get; set; }
        public double Tax { get; set; }
        public double Discount { get; set; }
        public double Total { get; set; }
    
        public virtual MeasureUnits MeasureUnits { get; set; }
        public virtual SalesInvoices SalesInvoices { get; set; }
        public virtual UnitConversion UnitConversion { get; set; }
        public virtual Warehouses Warehouses { get; set; }
    }
}