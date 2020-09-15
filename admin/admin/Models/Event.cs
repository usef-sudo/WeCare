using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace admin.Models
{
    public class Event
    {
        [Key]
        public int EventID { get; set; }

        [Required(ErrorMessage = "Discreption is required")]
        public string Discreption { get; set; }

        [Required(ErrorMessage = "Name is required")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Owner is required")]
        public Charity owner { get; set; }
        [Required(ErrorMessage = "Range is required")]
        public int moneyRange { get; set; }

        public int underProcess { get; set; }

    }
}
