using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace New_Horizons_Airlines_Web_Application.Data
{
    public class AirportModel
    {
        public string airport_id { get; set; }
        public string airport_name { get; set; }
        public string address { get; set; }
        public string website { get; set; }
        public string phone { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public double latitude { get; set; }
        public double longitude { get; set; }
        public string city_image_name { get; set; }
    }
}
