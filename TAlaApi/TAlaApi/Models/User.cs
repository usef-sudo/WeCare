using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TAlaApi.Models
{
    public class User
    {
        public int UserID { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public string NickName { get; set; }

        public int Age { get; set; }
    }
}
