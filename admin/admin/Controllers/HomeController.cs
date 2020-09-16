using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using admin.Models;
using System.Net.Http;
using Microsoft.AspNetCore.Authorization;

namespace admin.Controllers
{
    
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            IEnumerable<Donation> donations = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44326/api/");
                var response = client.GetAsync("donations");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readData = result.Content.ReadAsAsync<IEnumerable<Donation>>();
                    readData.Wait();
                    donations = readData.Result;
                }
                else
                {
                    donations = Enumerable.Empty<Donation>();
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            donations = donations.Where(d => d.Available);
            return View(donations);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
