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
    public class CharitiesController : Controller
    {
        private readonly ApplicationDbContext _context;

        public CharitiesController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Charities
        public IActionResult Index()
        {
            IEnumerable<Charity> charities = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44363/api/");
                var response = client.GetAsync("charities");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readData = result.Content.ReadAsAsync<IEnumerable<Charity>>();
                    readData.Wait();
                    charities = readData.Result;
                }
                else
                {
                    charities = Enumerable.Empty<Charity>();
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            return View(charities);
        }

        // GET: Charities/Details/5
        public IActionResult Details(int? id)
        {
            Charity charity = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44363/api/");
                //Call HTTP GET
                var response = client.GetAsync($"charities/{id}");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readData = result.Content.ReadAsAsync<Charity>();
                    readData.Wait();
                    charity = readData.Result;
                }
                else
                {
                    charity = new Charity { };
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            return View(charity);
        }

        // GET: Charities/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Charities/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create([Bind("CharityID,Email,Password,Name,Discreption")] Charity model)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44363/api/");
                //Call Http POST
                var postData = client.PostAsJsonAsync<Charity>("charities", model);
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

        // GET: Charities/Edit/5
        public IActionResult Edit(int? id)
        {
            Charity charity = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44363/api/");
                //Call HTTP GET
                var response = client.GetAsync($"charities/{id}");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readData = result.Content.ReadAsAsync<Charity>();
                    readData.Wait();
                    charity = readData.Result;
                }
                else
                {
                    charity = new Charity { };
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            return View(charity);
        }

        // POST: Charities/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int id, [Bind("CharityID,Email,Password,Name,Discreption")] Charity charity)
        {
            if (ModelState.IsValid)
            {
                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri("https://localhost:44363/api/");
                    //Call HTTP PUT
                    var response = client.PutAsJsonAsync($"charities/{id}", charity);
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
            return View(charity);
        }


        // GET: Charities/Delete/5
        public IActionResult Delete(int? id)
        {
            Charity charity = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44363/api/");
                //Call HTTP GET
                var response = client.GetAsync($"charities/{id}");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readData = result.Content.ReadAsAsync<Charity>();
                    readData.Wait();
                    charity = readData.Result;
                }
                else
                {
                    charity = new Charity { };
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            return View(charity);
        }

        // POST: Charities/Delete/5
        [HttpPost]
        public IActionResult Delete(Charity model)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44363/api/");
                //Call HTTP Delete
                var response = client.DeleteAsync($"charities/{model.CharityID}");
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
                var response = client.DeleteAsync($"charities/{id}");
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
    }
}
