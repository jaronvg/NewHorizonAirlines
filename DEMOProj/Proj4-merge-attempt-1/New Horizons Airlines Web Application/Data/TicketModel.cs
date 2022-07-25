using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace New_Horizons_Airlines_Web_Application.Data
{
    public class TicketModel
    {
        public int ticket_id { get; set; }
        public int flight_id { get; set; }
        public double price { get; set; }
        public int is_purchased { get; set; }
        public int tax { get; set; }
        public int taxPrice { get; set; }

    }
}