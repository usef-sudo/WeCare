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
    public class UsersController : Controller
    {
        private readonly ApplicationDbContext _context;

        public UsersController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Users
        public IActionResult Index()
        {
            IEnumerable<User> users = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44326/api/");
                var response = client.GetAsync("users");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readData = result.Content.ReadAsAsync<IEnumerable<User>>();
                    readData.Wait();
                    users = readData.Result;
                }
                else
                {
                    users = Enumerable.Empty<User>();
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            return View(users);
        }

        // GET: Users/Details/5
        public IActionResult Details(int? id)
        {
            User users = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44326/api/");
                //Call HTTP GET
                var response = client.GetAsync($"users/{id}");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readData = result.Content.ReadAsAsync<User>();
                    readData.Wait();
                    users = readData.Result;
                }
                else
                {
                    users = new User { };
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            return View(users);
        }

        // GET: Users/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Users/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create([Bind("UserID,Email,Password,NickName,Age")] User user)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44326/api/");
                //Call Http POST
                var postData = client.PostAsJsonAsync<User>("users", user);
                postData.Wait();
                var result = postData.Result;
                if (result.IsSuccessStatusCode)
                {
                    return RedirectToAction(nameof(Index));
                }
            }

            ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
            return View(user);
        }

        // GET: Users/Edit/5
        public IActionResult Edit(int? id)
        {
            User user = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44326/api/");
                //Call HTTP GET
                var response = client.GetAsync($"users/{id}");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readData = result.Content.ReadAsAsync<User>();
                    readData.Wait();
                    user = readData.Result;
                }
                else
                {
                    user = new User { };
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            return View(user);
        }

        // POST: Users/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int id, [Bind("UserID,Email,Password,NickName,Age")] User user)
        {
            if (ModelState.IsValid)
            {
                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri("https://localhost:44326/api/");
                    //Call HTTP PUT
                    var response = client.PutAsJsonAsync($"users/{id}", user);
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
            return View(user);
        }

        // GET: Users/Delete/5
        public IActionResult Delete(int? id)
        {
            User user = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44326/api/");
                //Call HTTP GET
                var response = client.GetAsync($"users/{id}");
                response.Wait();

                var result = response.Result;

                if (result.IsSuccessStatusCode)
                {
                    var readData = result.Content.ReadAsAsync<User>();
                    readData.Wait();
                    user = readData.Result;
                }
                else
                {
                    user = new User { };
                    ModelState.AddModelError(string.Empty, "Server Error . Please Contant System Admin!");
                }
            };
            return View(user);
        }

        // POST: Users/Delete/5
        [HttpPost]
        public IActionResult Delete(User model)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44326/api/");
                //Call HTTP Delete
                var response = client.DeleteAsync($"users/{model.UserID}");
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
                var response = client.DeleteAsync($"users/{id}");
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
