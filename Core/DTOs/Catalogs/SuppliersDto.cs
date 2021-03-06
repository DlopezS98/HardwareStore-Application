﻿using HardwareStore.Core.Entities.Providers;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HardwareStore.Core.DTOs.Catalogs
{
    public class SuppliersDto : Suppliers
    {
        [NotMapped]
        public string CreationDate { get => this.CreatedAt.ToString("dd-MMM-yyyy"); }
        [NotMapped]
        public string UpadteDate { get => this.UpdatedAt.ToString("dd-MMM-yyyy"); }
    }
}
