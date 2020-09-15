using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TAlaApi.Models
{
    public class Charity
    {
        public int CharityID { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public string Name { get; set; }

        public string Discreption { get; set; }

        public Byte[] img { get; set; }

        public List<Request> CharityDonations { get; set; }

        public List<Event> Events { get; set; }
    }
}
