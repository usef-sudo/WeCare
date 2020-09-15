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
    public class EventsController : Controller
    {
        private readonly ApplicationDbContext _context;

        public EventsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Events
        public IActionResult Index()
        {
            IEnumerable<Event> events = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44363/api/");
                var response = client.GetAsync("events");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readData = result.Content.ReadAsAsync<IEnumerable<Event>>();
                    readData.Wait();
                    events = readData.Result;
                }
                else
                {
                    events = Enumerable.Empty<Event>();
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            return View(events);
        }

        // GET: Events/Details/5
        public IActionResult Details(int? id)
        {
            Event events = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44363/api/");
                //Call HTTP GET
                var response = client.GetAsync($"events/{id}");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readData = result.Content.ReadAsAsync<Event>();
                    readData.Wait();
                    events = readData.Result;
                }
                else
                {
                    events = new Event { };
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            return View(events);
        }

        // GET: Events/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Events/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create([Bind("EventID,Discreption,Name,moneyRange,underProcess")] Event @event)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44363/api/Events");
                //Call Http POST
                var postData = client.PostAsJsonAsync<Event>("events", @event);
                postData.Wait();
                var result = postData.Result;
                if (result.IsSuccessStatusCode)
                {
                    return RedirectToAction(nameof(Index));
                }
            }

            ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
            return View(@event);
        }

        // GET: Events/Edit/5
        public IActionResult Edit(int? id)
        {
            Event events = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44363/api/");
                //Call HTTP GET
                var response = client.GetAsync($"events/{id}");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readData = result.Content.ReadAsAsync<Event>();
                    readData.Wait();
                    events = readData.Result;
                }
                else
                {
                    events = new Event { };
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            return View(events);
        }

        // POST: Events/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int id, [Bind("EventID,Discreption,Name,moneyRange,underProcess")] Event @event)
        {
            if (ModelState.IsValid)
            {
                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri("https://localhost:44363/api/");
                    //Call HTTP PUT
                    var response = client.PutAsJsonAsync($"charities/{id}", @event);
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
            return View(@event);
        }

        // GET: Events/Delete/5
        public IActionResult Delete(int? id)
        {
            Event events = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44363/api/");
                //Call HTTP GET
                var response = client.GetAsync($"events/{id}");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readData = result.Content.ReadAsAsync<Event>();
                    readData.Wait();
                    events = readData.Result;
                }
                else
                {
                    events = new Event { };
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            return View(events);
        }

        // POST: Events/Delete/5
        [HttpPost]
        public IActionResult Delete(Event model)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44363/api/");
                //Call HTTP Delete
                var response = client.DeleteAsync($"events/{model.EventID}");
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
                var response = client.DeleteAsync($"events/{id}");
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
