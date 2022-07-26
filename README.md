# Airline Ticket Sales Website (New Horizon Airlines)

### Overview
This project is focused on creating an airline eCommerce website that models a ticket reservation system for a single airline, 
‘New Horizons Airlines’. The airline reservation system incorporates flight schedules, fare tariffs, passenger reservation, booking flights,
and submitting customer feedback. The website was designed for the intended use of customers who seek to view and book available trips 
provided by New Horizons Airlines, as well as customer service employees and administrators of the company.
The website is built using HTML/CSS, JavaScript, Razor Pages, client-side UI framework Blazor, ASP.Net Core web framework, 
Entity Framework Core, C#, micro ORM Dapper, and a MySQL database. To simulate a real airline website, real flight data was collected using 
a Google Apps script. This data, as well as all other user data was store in the database.  

### Required Software
1. Visual Studio
2. MySQL (Recommended)

### Running the Project
1.	Visual Studio is required to run the application; preferably the latest version.
2.	Once Visual Studio is installed, download the project (includes the code and database information).
3.	Extract the files into a new folder, then open MySQL.
4.	Create a new database with the name “new_horizons_db” on your local server. This project used MySQL local server to do so. 
5.	Now you should have an empty database. The next step is importing the data. If using MySQL and under your local instance, this can be done through the server menu by clicking “Data Import”.
6.	Select the DatabaseData folder provided and click “Start”.
7.	The project can now be opened. Go to the extracted code folder and click the “DEMOProj” folder, then the “Proj4-merge-attempt-1” folder. 
8.	The solution for the project is included in this folder and named “New Horizons Airlines Web Application.sln”. Open this file in Visual Studio.
9.	Once this file is open, the appsettings.json file must be updated. Provide your appropriate path to your local server, as well as user id and password in the Default Connection string. 
10.	Click the start button labeled “IIS Express” to run the website. 
