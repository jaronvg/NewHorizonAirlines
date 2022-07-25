using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace New_Horizons_Airlines_Web_Application.Data
{
    public class PurchaseModel
    {

        public int ticket_id { get; set; }
        public double price { get; set; }
        public int seats_remaining { get; set; }

    }
}