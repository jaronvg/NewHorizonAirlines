using Microsoft.Extensions.Configuration;
using New_Horizons_Airlines_Web_Application.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace New_Horizons_Airlines_Web_Application.Pages
{
    public partial class Index
    {
        // Date picker code:
        private DateTime selectedDate = DateTime.Today;
        private DateTime startDate = new DateTime(2021, 04, 01);
        private DateTime endDate = new DateTime(2021, 07, 31);

        private void onChange(Syncfusion.Blazor.Calendars.ChangedEventArgs<DateTime> args)
        {
            selectedDate = args.Value;
            StateHasChanged();
        }

        // Flight search code:

        private string departing_airport = "ATL, Atlanta";
        private string arrival_airport = "DEN, Denver";
        private int passengerCount = 1;

        private List<AirportModel> airports = new List<AirportModel>();
        private List<Roles> usersWithNoRole;
        protected override async Task OnInitializedAsync()
        {
            string sql = "select airport_id, airport_name, address, website, phone, city, state, latitude, longitude, city_image_name from airports";
            airports = await _data.LoadData<AirportModel, dynamic>(sql, new { }, _config.GetConnectionString("DefaultConnection"));
            string sql4 = "select U.Email FROM new_horizons_db.aspnetusers U WHERE U.Email NOT IN (select U.Email FROM new_horizons_db.aspnetusers U, new_horizons_db.aspnetuserroles R WHERE U.Id = R.UserId)";
            usersWithNoRole = await _data.LoadData<Roles, dynamic>(sql4, new { }, _config.GetConnectionString("DefaultConnection"));
            foreach (var user in usersWithNoRole)
            {
                string sql5 = "insert into new_horizons_db.aspnetuserroles (UserId, RoleId) SELECT U.Id, R.Id FROM new_horizons_db.aspnetusers U, new_horizons_db.aspnetroles R WHERE U.Username = '" + user.Email + "' AND R.Name = 'customer';";
                await _data.SaveData<dynamic>(sql5, new { }, _config.GetConnectionString("DefaultConnection"));
            }
        }

        private List<FlightSearchModel> searchResults;

        protected async Task SearchFlights()
        {
            string loc1 = departing_airport.Split(',')[0];
            string loc2 = arrival_airport.Split(',')[0];
            string date1 = selectedDate.ToString().Split(' ')[0].Split('/')[2] + '-' + selectedDate.ToString().Split(' ')[0].Split('/')[0] + '-' + selectedDate.ToString().Split(' ')[0].Split('/')[1];
            int seatTot = passengerCount;
            string line1 = "SELECT flight_id, flight_duration, flight_date AS departing_date, convert(concat('2021-04-01 ', flight_time), datetime) as departing_time, convert(TIMESTAMPADD(MINUTE, flight_duration*60, flight_time), datetime) as arrival_time, departing_city, departing_state, departing_airport_name, departing_airport_id, arrival_city, arrival_state, arrival_airport_name, arrival_airport_id, departing_lat, departing_long, arrival_lat, arrival_long ";
            string line2 = "FROM(SELECT * FROM(SELECT * FROM(SELECT airport_id AS departing_airport_id, airport_name AS departing_airport_name, city AS departing_city, state AS departing_state, latitude AS departing_lat, longitude AS departing_long FROM new_horizons_db.airports WHERE airport_id = @location1) AS departing_location, ";
            string line3 = "(SELECT airport_id AS arrival_airport_id, airport_name AS arrival_airport_name, city AS arrival_city, state AS arrival_state, latitude AS arrival_lat, longitude AS arrival_long FROM new_horizons_db.airports WHERE airport_id = @location2) AS arrival_location) AS airport_locations, new_horizons_db.flight_paths ";
            string line4 = "WHERE departing_airport_id = departing_airport AND arrival_airport_id = arrival_airport) AS flight_path_info, new_horizons_db.flights WHERE flight_path_info.flight_path_id = flights.flight_path_id AND seats_remaining >= @peopleNum AND flight_date = @argDate;";
            string sql = line1 + line2 + line3 + line4;
            searchResults = await _data.LoadData<FlightSearchModel, dynamic>(sql, new { location1 = loc1, location2 = loc2, peopleNum = seatTot, argDate = date1 }, _config.GetConnectionString("DefaultConnection"));

            if (searchResults.Count == 0)
            {
                searchResults = new List<FlightSearchModel>() { new FlightSearchModel { flight_id = -1, departing_time = new DateTime(2008, 5, 1, 8, 30, 52), arrival_time = new DateTime(2008, 5, 1, 9, 30, 52), departing_lat = 90.0000, departing_long = 0.00000, arrival_lat = -28.48322, arrival_long = 24.676997 } };
            }
            LoadMap();
        }
        // MAP code:
        public class MarkerLocation
        {
            public double Latitude { get; set; }
            public double Longitude { get; set; }
            public string Name { get; set; }
        };

        private TimeSpan flightDuration;
        public List<double> naviagtionLineOne, naviagtionLineTwo;

        public List<MarkerLocation> AirportLocation1, AirportLocation2, AirportDistance;

        private void LoadMap()
        {
            // Local variables
            flightDuration = searchResults[0].arrival_time - searchResults[0].departing_time;
            double dep_lat = searchResults[0].departing_lat, dep_long = searchResults[0].departing_long;
            double arr_lat = searchResults[0].arrival_lat, arr_long = searchResults[0].arrival_long;

            // Load latitude and longitude data:
            naviagtionLineOne = new List<double>() { arr_lat, dep_lat };

            naviagtionLineTwo = new List<double>() { arr_long, dep_long };

            AirportLocation1 = new List<MarkerLocation>() { new MarkerLocation { Latitude = dep_lat, Longitude = dep_long, Name = "" } };

            AirportLocation2 = new List<MarkerLocation>() { new MarkerLocation { Latitude = arr_lat, Longitude = arr_long, Name = "" } };

            AirportDistance = new List<MarkerLocation>();
            AirportDistance.Add(new MarkerLocation
            {
                Latitude = 2 + Math.Min(arr_lat, dep_lat) + Math.Abs(arr_lat - dep_lat) / 2,
                Longitude = Math.Min(arr_long, dep_long) + Math.Abs(arr_long - dep_long) / 2,
                Name = "tooltip"
            });
        }
    }
}