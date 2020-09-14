using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TAlaApi.Models
{
    public class Donation
    {
        public int DonationID { get; set; }

        public string Phone { get; set; }

        public string Discreption { get; set; }

        public string Location { get; set; }

        public bool PickUp { get; set; }

        public Byte[] photo { get; set; }

        public bool Adaptation { get; set; } = true;
    }
}
