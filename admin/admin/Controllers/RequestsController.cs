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
    public class RequestsController : Controller
    {
        private readonly ApplicationDbContext _context;

        public RequestsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Requests
        public IActionResult Index()
        {
            IEnumerable<Request> requests = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44326/api/");
                var response = client.GetAsync("requests");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readData = result.Content.ReadAsAsync<IEnumerable<Request>>();
                    readData.Wait();
                    requests = readData.Result;
                }
                else
                {
                    requests = Enumerable.Empty<Request>();
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            return View(requests);
        }

        // GET: Requests/Details/5
        public IActionResult Details(int? id)
        {
            Request request = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44326/api/");
                //Call HTTP GET
                var response = client.GetAsync($"requests/{id}");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readData = result.Content.ReadAsAsync<Request>();
                    readData.Wait();
                    request = readData.Result;
                }
                else
                {
                    request = new Request { };
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            return View(request);
        }

        // GET: Requests/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Requests/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create([Bind("RequestID,Phone,Discreption,Location,Type,Available")] Request model)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44326/api/");
                //Call Http POST
                var postData = client.PostAsJsonAsync<Request>("requests", model);
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

        // GET: Requests/Edit/5
        public IActionResult Edit(int? id)
        {
            Request request = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44326/api/");
                //Call HTTP GET
                var response = client.GetAsync($"requests/{id}");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readData = result.Content.ReadAsAsync<Request>();
                    readData.Wait();
                    request = readData.Result;
                }
                else
                {
                    request = new Request { };
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            return View(request); ;
        }

        // POST: Requests/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int id, [Bind("RequestID,Phone,Discreption,Location,Type,Available")] Request request)
        {
            if (ModelState.IsValid)
            {
                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri("https://localhost:44326/api/");
                    //Call HTTP PUT
                    var response = client.PutAsJsonAsync($"requests/{id}", request);
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
            return View(request);
        }

        // GET: Requests/Delete/5
        public IActionResult Delete(int? id)
        {
            Request request = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44326/api/");
                //Call HTTP GET
                var response = client.GetAsync($"requests/{id}");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readData = result.Content.ReadAsAsync<Request>();
                    readData.Wait();
                    request = readData.Result;
                }
                else
                {
                    request = new Request { };
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            return View(request);
        }

        // POST: Reuests/Delete/5
        [HttpPost]
        public IActionResult Delete(Request model)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44326/api/");
                //Call HTTP Delete
                var response = client.DeleteAsync($"requests/{model.RequestID}");
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
                client.BaseAddress = new Uri("https://localhost:44326/api/");
                //Call HTTP GET
                var response = client.DeleteAsync($"requests/{id}");
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
    
    
        public IActionResult Catigory(string type)
        {
            IEnumerable<Request> requests = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44326/api/Requests");
                var response = client.GetAsync("");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readData = result.Content.ReadAsAsync<IEnumerable<Request>>();
                    readData.Wait();
                    requests = readData.Result;
                }
                else
                {
                    requests = Enumerable.Empty<Request>();
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            return View(requests);
        }
    
    }
}
