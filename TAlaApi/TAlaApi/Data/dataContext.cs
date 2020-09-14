using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using TAlaApi.Models;

namespace TAlaApi.Models
{
    public class dataContext : DbContext
    {
        public dataContext (DbContextOptions<dataContext> options)
            : base(options)
        {
        }

        public DbSet<TAlaApi.Models.Charity> Charity { get; set; }

        public DbSet<TAlaApi.Models.Donation> Donation { get; set; }

        public DbSet<TAlaApi.Models.Event> Event { get; set; }

        public DbSet<TAlaApi.Models.Request> Request { get; set; }

        public DbSet<TAlaApi.Models.User> User { get; set; }
    }
}
