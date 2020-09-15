using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace admin.Models
{
    public class Charity
    {
        [Key]
        public int CharityID { get; set; }
        [EmailAddress]
        [Required(ErrorMessage = "Email is required")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Password is required")]
        public string Password { get; set; }

        [Required(ErrorMessage = "Name is required")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Discreption is required")]
        public string Discreption { get; set; }

        public List<Request> CharityDonations { get; set; }

        public List<Event> Events { get; set; }
    }
}
