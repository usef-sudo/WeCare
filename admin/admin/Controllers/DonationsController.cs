using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using admin.Data;
using admin.Models;
using System.Net.Http;

namespace admin.Controllers
{
    public class DonationsController : Controller
    {
        private readonly ApplicationDbContext _context;

        public DonationsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Donations
        public IActionResult Index()
        {
            IEnumerable<Donation> donations = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44363/api/");
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
            return View(donations);
        }

        // GET: Donations/Details/5
        public IActionResult Details(int? id)
        {
            Donation donation = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44363/api/");
                //Call HTTP GET
                var response = client.GetAsync($"donations/{id}");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readData = result.Content.ReadAsAsync<Donation>();
                    readData.Wait();
                    donation = readData.Result;
                }
                else
                {
                    donation = new Donation { };
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            return View(donation);
        }

        // GET: Donations/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Donations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create([Bind("DonationID,Phone,Discreption,Location,PickUp,ImgData,Available")] Donation model)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44363/api/");
                //Call Http POST
                var postData = client.PostAsJsonAsync<Donation>("donations", model);
                postData.Wait();
                var result = postData.Result;
                if (result.IsSuccessStatusCode)
                {
                    return RedirectToAction(nameof(Index));
                }
            }

            ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
            return View(model);
        }

        // GET: Donations/Edit/5
        public IActionResult Edit(int? id)
        {
            Donation donation = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44363/api/");
                //Call HTTP GET
                var response = client.GetAsync($"donations/{id}");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readData = result.Content.ReadAsAsync<Donation>();
                    readData.Wait();
                    donation = readData.Result;
                }
                else
                {
                    donation = new Donation { };
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            return View(donation);
        }

        // POST: Donations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int id, [Bind("DonationID,Phone,Discreption,Location,PickUp,ImgData,Available")] Donation donation)
        {
            if (ModelState.IsValid)
            {
                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri("https://localhost:44363/api/");
                    //Call HTTP PUT
                    var response = client.PutAsJsonAsync($"donations/{id}", donation);
                    response.Wait();


                    var result = response.Result;
                    if (result.IsSuccessStatusCode)
                    {
                        return RedirectToAction(nameof(Index));
                    }
                    else
                    {
                        ModelState.AddModelError(string.Empty, "Server error. Please contact sys admin!");
                    }
                }
            }
            return View(donation);
        }

        // GET: Donations/Delete/5
        public IActionResult Delete(int? id)
        {
            Donation donation = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44363/api/");
                //Call HTTP GET
                var response = client.GetAsync($"donations/{id}");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readData = result.Content.ReadAsAsync<Donation>();
                    readData.Wait();
                    donation = readData.Result;
                }
                else
                {
                    donation = new Donation { };
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            return View(donation);
        }

        // POST: Donations/Delete/5
        [HttpPost]
        public IActionResult Delete(Donation model)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44363/api/");
                //Call HTTP Delete
                var response = client.DeleteAsync($"donations/{model.DonationID}");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    return RedirectToAction(nameof(Index));
                }
                else
                {
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            return View(model);
        }
        public IActionResult ConDelete(int id)
        {

            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44363/api/");
                //Call HTTP GET
                var response = client.DeleteAsync($"donations/{id}");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    return RedirectToAction(nameof(Index));
                }
                else
                {

                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            return View();
        }

        //private bool DonationExists(int id)
        //{
        //    return _context.Donation.Any(e => e.DonationID == id);
        //}


        public IActionResult MakeAvailable(int id)
        {
            IEnumerable<Donation> donations = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44363/api/");
                var response = client.GetAsync($"donations/{id}");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readData = result.Content.ReadAsAsync<IEnumerable<Donation>>();
                    readData.Wait();
                    donations = readData.Result;

                    client.BaseAddress = new Uri("https://localhost:44363/api/");
                    donations.FirstOrDefault().Available = true;
                    //Call HTTP PUT
                    response = client.PutAsJsonAsync($"donations/{id}", donations);
                    response.Wait();


                    result = response.Result;
                    if (result.IsSuccessStatusCode)
                    {
                        return RedirectToAction(nameof(Index), "Home");
                    }
                    else
                    {
                        ModelState.AddModelError(string.Empty, "Server error. Please contact sys admin!");
                    }
                }
                else
                {
                    donations = Enumerable.Empty<Donation>();
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            }
            return View(nameof(Index));

        }

    }

}
