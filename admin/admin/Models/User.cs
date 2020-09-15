using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace admin.Models
{
    public class User
    {
        [Key]
        public int UserID { get; set; }

        [EmailAddress]
        [Required(ErrorMessage = "Email is required")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Password is required")]
        public string Password { get; set; }

        [Required(ErrorMessage = "NickName is required")]
        public string NickName { get; set; }

        [Required(ErrorMessage = "Age is required")]
        [Range(17, 70, ErrorMessage = "Your age is not in the range")]
        public int Age { get; set; }
    }
}
