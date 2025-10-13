using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Project_1_API.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Project_1_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DestinationsController(Project1DatabaseContext context) : ControllerBase
    {
        private readonly Project1DatabaseContext _context = context;

        [Authorize]
        [HttpGet]
        [Route("getCurrencyByID/{id}")]
        public async Task<Object> GetUserById(int id)
        {
            var currencies = await _context.Currencies.ToListAsync();
            var currency = currencies.Find(c => c.CurrId == id);

            return Ok(currency);
        }

    }
}
