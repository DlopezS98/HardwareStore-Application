﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static HardwareStore.Core.Entities.Enums;

namespace HardwareStore.Core.Entities.ProductsAdmin
{
    public class PendingTransfers : BaseEntity
    {
        public string Code { get; set; }
        public int ProductStocksId { get; set; }
        public string LotNumber { get; set; }
        public string StocksCode { get; set; }
        public string ProductDetailCode { get; set; }
        public int WarehouseId { get; set; }
        public int PurchasedUnitId { get; set; }
        public int TargetWarehouseId { get; set; }
        public int UnitTypeId { get; set; }
        public int UnitBaseId { get; set; }
        public int TargetUnitId { get; set; }
        public int UnitQuantity { get; set; }
        public int UnitConversionId { get; set; }
        public double ConversionQuantity { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public string CreatedBy { get; set; }
        public string UpdatedBy { get; set; }
        public TransferStatus TransferStatus { get; set; }
    }
}
