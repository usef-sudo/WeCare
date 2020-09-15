using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace admin.Models
{
    public class Donation
    {
        [Key]
        public int DonationID { get; set; }

        [Phone]
        [Required(ErrorMessage = "Phone number is required")]
        public string Phone { get; set; }

        [Required(ErrorMessage = "Discreption is required")]
        public string Discreption { get; set; }

        [Required(ErrorMessage = "Location is required")]
        public string Location { get; set; }

        public bool PickUp { get; set; }
        public Byte[] ImgData { get; set; }
        public bool Available { get; set; }
    }
}
