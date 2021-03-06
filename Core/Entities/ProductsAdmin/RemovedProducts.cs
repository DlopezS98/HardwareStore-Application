﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Core.Entities.ProductsAdmin
{
    public class RemovedProducts : BaseEntity
    {
        public int ProductStocksId { get; set; }
        public string LotNumber { get; set; }
        public string StocksDetailCode { get; set; }
        public int MeasureUnitId { get; set; }
        public int UnitQuantity { get; set; }
        public int UnitBaseId { get; set; }
        public double ConversionQuantity { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public DateTime CreatedAt { get; set; }
        public string CreatedBy { get; set; }

        [ForeignKey("ProductStocksId")]
        public virtual ProductStocks ProductStocks { get; set; }
    }
}
