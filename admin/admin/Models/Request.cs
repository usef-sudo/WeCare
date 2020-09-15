using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace admin.Models
{
    public class Request
    {
        [Key]
        public int RequestID { get; set; }

        [Phone]
        [Required(ErrorMessage = "Phone number is required")]
        public string Phone { get; set; }

        [Required(ErrorMessage = "Discreption is required")]
        public string Discreption { get; set; }

        [Required(ErrorMessage = "Location is required")]
        public string Location { get; set; }

        public string Type { get; set; }
        public bool Available { get; set; } = true;
    }
}
