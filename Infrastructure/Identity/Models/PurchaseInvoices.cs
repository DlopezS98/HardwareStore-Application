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
    
    public partial class PurchaseInvoices
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PurchaseInvoices()
        {
            this.PurchaseDetails = new HashSet<PurchaseDetails>();
        }
    
        public int Id { get; set; }
        public string VendorCode { get; set; }
        public string InvoiceNumber { get; set; }
        public string SupplierInvoiceNumber { get; set; }
        public double Tax { get; set; }
        public double Subtotal { get; set; }
        public int Discount { get; set; }
        public double TotalAmount { get; set; }
        public bool Deleted { get; set; }
        public System.DateTime CreatedAt { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime UpdatedAt { get; set; }
        public string UpdatedBy { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PurchaseDetails> PurchaseDetails { get; set; }
    }
}