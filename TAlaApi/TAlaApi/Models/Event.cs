using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TAlaApi.Models
{
    public class Event
    {
        public int EventID { get; set; }

        public string Discreption { get; set; }

        public string Name { get; set; }

        public Charity owner { get; set; }

        public int moneyRange { get; set; }

        public int underProcess { get; set; }
    }
}
