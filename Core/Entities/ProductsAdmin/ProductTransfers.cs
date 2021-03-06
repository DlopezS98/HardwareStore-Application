﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HardwareStore.Core.Entities.Catalogs;
using static HardwareStore.Core.Entities.Enums;

namespace HardwareStore.Core.Entities.ProductsAdmin
{
    public class ProductTransfers : BaseEntity
    {
        public string Code { get; set; }
        public int TotalProducts { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public string CreatedBy { get; set; }
        public string UpdatedBy { get; set; }
        public TransferStatus TransferStatus { get; set; }

        //public virtual ProductStocks ProductStocks { get; set; }
        //public virtual Warehouses Warehouses { get; set; }
        public virtual ICollection<TransfersDetails> TransfersDetails { get; set; }
    }
}
