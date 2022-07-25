﻿using System;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using New_Horizons_Airlines_Web_Application.Data;

[assembly: HostingStartup(typeof(New_Horizons_Airlines_Web_Application.Areas.Identity.IdentityHostingStartup))]
namespace New_Horizons_Airlines_Web_Application.Areas.Identity
{
    public class IdentityHostingStartup : IHostingStartup
    {
        public void Configure(IWebHostBuilder builder)
        {
            builder.ConfigureServices((context, services) => {
            });
        }
    }
}