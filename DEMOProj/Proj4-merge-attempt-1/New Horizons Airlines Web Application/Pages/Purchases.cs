using Microsoft.Extensions.Configuration;
using New_Horizons_Airlines_Web_Application.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNetCore.Identity;
using New_Horizons_Airlines_Web_Application.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Components;






namespace New_Horizons_Airlines_Web_Application.Pages
{


    public partial class Purchase
    {
        double priceOfAllTickets = 0;
        double taxAmount = 0;
        double priceTotal = 0;
        int hours = 0;
        int minutes = 0;
        int dt_month;
        int dt_day;
        int dt_year;
        DateTime dt;



        private List<PurchaseModel> PurchaseTickets = new List<PurchaseModel>();


        private List<FlightSearchModel> getFlightInfo = new List<FlightSearchModel>();

        private List<TicketModel> getTickets = new List<TicketModel>();
        private List<TicketModel> getPrices = new List<TicketModel>();
        private List<FlightSearchModel> getSeats = new List<FlightSearchModel>();

        protected override async Task OnInitializedAsync()
        {

            int countConvert = Int32.Parse(passCount);
            int flightIDConvert = Int32.Parse(myFlightID);
            string sqlString = "select ticket_id, price, seats_remaining from tickets, (select seats_remaining from flights where flight_id=@flightID) as nestedQuery where flight_id=@flightID and is_purchased=0 limit @count;";
            PurchaseTickets = await _data.LoadData<PurchaseModel, dynamic>(sqlString, new { flightID = myFlightID, count = countConvert }, _config.GetConnectionString("DefaultConnection"));

            //change these, pass as params
            string sql = "select flight_duration from flights, flight_paths where flight_id=@flightID AND flights.flight_path_id=flight_paths.flight_path_id";
            getFlightInfo = await _data.LoadData<FlightSearchModel, dynamic>(sql, new { flightID = myFlightID }, _config.GetConnectionString("DefaultConnection"));
            /*
                        string sql9 = "select seats_remaining from flights where flight_id = @flightID";
                        getSeats = await _data.LoadData<FlightSearchModel, dynamic>(sql9, new { flightID = myFlightID }, _config.GetConnectionString("DefaultConnection")); 
                        string sql8 = "select ticket_id, price, seats_remaining from tickets, flights where tickets.flight_id=flights.flight_id and flights.flight_id=@flightID and is_purchased=0"; 
                        getTickets = await _data.LoadData<TicketModel, dynamic>(sql8, new { flightID = myFlightID }, _config.GetConnectionString("DefaultConnection"));
                        string sql10 = "select ticket_id, price, seats_remaining from tickets, (select seats_remaining from flights where flight_id=@flightID) as nestedQuery where flight_id=1 and is_purchased=0;";
                        // getPrices = await _data.LoadData<TicketModel, dynamic>(sql10, new { flightID = myFlightID, passCount = count }, _config.GetConnectionString("DefaultConnection"));
                     */
            string getCost = "select ticket_id, price from tickets where flight_id=@flightID and is_purchased=0 limit @passCount;";
            getPrices = await _data.LoadData<TicketModel, dynamic>(getCost, new { flightID = flightIDConvert, passCount = countConvert }, _config.GetConnectionString("DefaultConnection"));


            foreach (var getPrice in PurchaseTickets)
            {
                priceOfAllTickets = priceOfAllTickets + getPrice.price;
            }
            taxAmount = priceOfAllTickets * .1;

            priceTotal = priceOfAllTickets * 1.1;



            double duratonDouble = Convert.ToDouble(duration);
            hours = Convert.ToInt32(Math.Floor(duratonDouble));
            minutes = Convert.ToInt32(60 * (duratonDouble - Math.Truncate(duratonDouble)));



            dt_month = Int32.Parse(departing_date_month);
            dt_day = Int32.Parse(departing_date_day);
            dt_year = Int32.Parse(departing_date_year);
            dt = new DateTime(dt_year, dt_month, dt_day);

        }
        private async Task UpdateFlightsTable()
        {
            int count = Int32.Parse(passCount);

            string updateFlights = "update flights set seats_remaining = (seats_remaining-@passNumber) where flight_id = @flightID;";
            await _data.LoadData<PurchaseModel, dynamic>(updateFlights, new { flightID = myFlightID, passNumber = count }, _config.GetConnectionString("DefaultConnection"));

        }
        private async Task UpdateTickets(int tid)
        {

            string updateTickets = "update tickets set is_purchased = 1 where ticket_id = @tid;";
            await _data.SaveData<dynamic>(updateTickets, new { tid = tid }, _config.GetConnectionString("DefaultConnection"));
        }


        private async Task UpdatePurchases(int tid)
        {
            string UserName2 = httpContextAccessor.HttpContext.User.Identity.Name;
            string updatePurchase = "insert into purchases(Id, ticket_id) values(@UID, @tid);";
            await _data.SaveData<dynamic>(updatePurchase, new { tid = tid, UID = UserName2 }, _config.GetConnectionString("DefaultConnection"));
        }


        private async Task updateDatabase()
        {
            string UserName = httpContextAccessor.HttpContext.User.Identity.Name;
            //System.Web.HttpContext.Current.User != null
            //Request.IsAuthenticated
            //User.Identity.IsAuthenticated
            //Request.User.IsAuthenticated
            var isAuthenticated = this.httpContextAccessor.HttpContext.User.Identity.IsAuthenticated;

            if (isAuthenticated)
            {
                await jsRuntime.InvokeAsync<bool>("notifyPurchase", null);
                for (int i = 0; i < PurchaseTickets.Count(); i++)
                {
                    await UpdatePurchases(PurchaseTickets[i].ticket_id);
                    await UpdateTickets(PurchaseTickets[i].ticket_id);

                }
                await UpdateFlightsTable();

            }
            else
            {
                await jsRuntime.InvokeAsync<bool>("notifyLogin", null);
            }

        }

    }



}