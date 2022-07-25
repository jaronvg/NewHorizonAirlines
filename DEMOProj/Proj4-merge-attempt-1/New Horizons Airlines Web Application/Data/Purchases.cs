using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace New_Horizons_Airlines_Web_Application.Data
{
    public class Purchases
    {
        public string departing_airport { get; set; }
        public string arrival_airport { get; set; }
        public string flight_duration { get; set; }
        public string departing_time { get; set; }
        public string flight_id { get; set; }
        public string flight_date { get; set; }
        public string ticket_id { get; set; }
        public string distance { get; set; }
        public string arriving_time { get; set; }
        public string price { get; set; }
    }
}
