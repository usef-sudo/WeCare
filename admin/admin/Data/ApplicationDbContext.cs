using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using admin.Models;

namespace admin.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }
        public DbSet<admin.Models.Charity> Charity { get; set; }
        public DbSet<admin.Models.Donation> Donation { get; set; }
        public DbSet<admin.Models.Request> Request { get; set; }
        public DbSet<admin.Models.Event> Event { get; set; }
        public DbSet<admin.Models.User> User { get; set; }
    }
}
