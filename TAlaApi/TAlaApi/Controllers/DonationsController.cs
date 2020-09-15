using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TAlaApi.Models;

namespace TAlaApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DonationsController : ControllerBase
    {
            private readonly dataContext _context;

            public DonationsController(dataContext context)
            {
                _context = context;
            }

            // GET: api/Donations
            [HttpGet]
            public async Task<ActionResult<IEnumerable<Donation>>> GetDonation()
            {
                return await _context.Donation.ToListAsync();
            }

            // GET: api/Donations/5
            [HttpGet("{id}")]
            public async Task<ActionResult<Donation>> GetDonation(int id)
            {
                var donation = await _context.Donation.FindAsync(id);

                if (donation == null)
                {
                    return NotFound();
                }

                return donation;
            }

            // PUT: api/Donations/5
            // To protect from overposting attacks, please enable the specific properties you want to bind to, for
            // more details see https://aka.ms/RazorPagesCRUD.
            [HttpPut("{id}")]
            public async Task<IActionResult> PutDonation(int id, Donation donation)
            {
                if (id != donation.DonationID)
                {
                    return BadRequest();
                }

                _context.Entry(donation).State = EntityState.Modified;

                try
                {
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!DonationExists(id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }

                return NoContent();
            }

            // POST: api/Donations
            // To protect from overposting attacks, please enable the specific properties you want to bind to, for
            // more details see https://aka.ms/RazorPagesCRUD.
            [HttpPost]
            public async Task<ActionResult<Donation>> PostDonation(Donation donation)
            {
                _context.Donation.Add(donation);
                await _context.SaveChangesAsync();

                return CreatedAtAction("GetDonation", new { id = donation.DonationID }, donation);
            }

            // DELETE: api/Donations/5
            [HttpDelete("{id}")]
            public async Task<ActionResult<Donation>> DeleteDonation(int id)
            {
                var donation = await _context.Donation.FindAsync(id);
                if (donation == null)
                {
                    return NotFound();
                }

                _context.Donation.Remove(donation);
                await _context.SaveChangesAsync();

                return donation;
            }

            private bool DonationExists(int id)
            {
                return _context.Donation.Any(e => e.DonationID == id);
            }
        }
    }
