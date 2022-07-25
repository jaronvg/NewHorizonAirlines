using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace New_Horizons_Airlines_Web_Application.Data
{
    public class FlightSearchModel
    {
        public int flight_id { get; set; }
        public DateTime departing_date { get; set; }
        public DateTime departing_time { get; set; }
        public DateTime arrival_time { get; set; }
        public string departing_city { get; set; }
        public string departing_state { get; set; }
        public string departing_airport_name { get; set; }
        public string departing_airport_id { get; set; }
        public string arrival_city { get; set; }
        public string arrival_state { get; set; }
        public string arrival_airport_name { get; set; }
        public string arrival_airport_id { get; set; }
        public double departing_lat { get; set; }
        public double departing_long { get; set; }
        public double arrival_lat { get; set; }
        public double arrival_long { get; set; }




        public double flight_duration { get; set; }
        public int seats_remaining { get; set; }
    }
}