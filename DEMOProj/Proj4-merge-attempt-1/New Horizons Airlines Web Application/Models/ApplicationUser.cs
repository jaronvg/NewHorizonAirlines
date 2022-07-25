using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// Author: Josue Gonzalez
// This model is used to add attributes to the aspnetusers table
namespace New_Horizons_Airlines_Web_Application.Models
{
    public class ApplicationUser : IdentityUser
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string ZipCode { get; set; }
        public string DateOfBirth { get; set; }
    }
}
