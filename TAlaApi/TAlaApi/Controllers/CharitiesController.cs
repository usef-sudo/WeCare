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
    [Route("api/charities")]
    [ApiController]
    public class CharitiesController : ControllerBase
    {
        private readonly dataContext _context;

        public CharitiesController(dataContext context)
        {
            _context = context;
        }

        // GET: api/Charities
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Charity>>> GetCharity()
        {
            return await _context.Charity.ToListAsync();
        }

        // GET: api/Charities/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Charity>> GetCharity(int id)
        {
            var charity = await _context.Charity.FindAsync(id);

            if (charity == null)
            {
                return NotFound();
            }

            return charity;
        }

        // PUT: api/Charities/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCharity(int id, Charity charity)
        {
            if (id != charity.CharityID)
            {
                return BadRequest();
            }

            _context.Entry(charity).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CharityExists(id))
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

        // POST: api/Charities
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<Charity>> PostCharity(Charity charity)
        {
            _context.Charity.Add(charity);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCharity", new { id = charity.CharityID }, charity);
        }

        // DELETE: api/Charities/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Charity>> DeleteCharity(int id)
        {
            var charity = await _context.Charity.FindAsync(id);
            if (charity == null)
            {
                return NotFound();
            }

            _context.Charity.Remove(charity);
            await _context.SaveChangesAsync();

            return charity;
        }

        private bool CharityExists(int id)
        {
            return _context.Charity.Any(e => e.CharityID == id);
        }
    }
}
