using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TAlaApi.Models
{
    public class Request
    {
        public int RequestID { get; set; }

        public string Phone { get; set; }

        public string Discreption { get; set; }

        public string Location { get; set; }

        public string Type { get; set; }

        public bool Adoptation { get; set; }

        public int moneyRange { get; set; }

        public int underProcess { get; set; }
    }
}
