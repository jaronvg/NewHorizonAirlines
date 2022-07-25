using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using New_Horizons_Airlines_Web_Application.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace New_Horizons_Airlines_Web_Application.Data
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }
    }
}
