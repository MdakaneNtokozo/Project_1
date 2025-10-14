using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Project_1_API.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Project_1_API.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class DestinationsController(Project1DatabaseContext context) : ControllerBase
    {
        private readonly Project1DatabaseContext _context = context;

        [HttpGet]
        [Route("getCurrencyByID/{id}")]
        public async Task<Object> GetUserById(int id)
        {
            var currencies = await _context.Currencies.ToListAsync();
            var currency = currencies.Find(c => c.CurrId == id);

            return Ok(currency);
        }

        [HttpGet]
        [Route("getCurrencies")]
        public async Task<Object> GetCurrencies()
        {
            return Ok(await _context.Currencies.ToListAsync());
        }

        [HttpGet]
        [Route("getDestinations")]
        public async Task<Object> GetDestinations()
        {
            return Ok(await _context.Destinations.ToListAsync());
        }

        [HttpGet]
        [Route("getTransportations")]
        public async Task<Object> GetTransportaions()
        {
            return Ok(await _context.Transportations.ToListAsync());
        }

        [HttpGet]
        [Route("getTransportationTypes")]
        public async Task<Object> GetTransportationTypes()
        {
            return Ok(await _context.TransportationTypes.ToListAsync());
        }

        [HttpGet]
        [Route("getAccommodations")]
        public async Task<Object> GetAccommodations()
        {
            return Ok(await _context.Accomodations.ToListAsync());
        }

        [HttpGet]
        [Route("getAccommodationTypes")]
        public async Task<Object> GetAccommodationTypes()
        {
            return Ok(await _context.AccomodationTypes.ToListAsync());
        }

        [HttpGet]
        [Route("getFoodPlaces")]
        public async Task<Object> GetFoodPlaces()
        {
            return Ok(await _context.FoodPlaces.ToListAsync());
        }

        [HttpGet]
        [Route("getFoodPlaceTypes")]
        public async Task<Object> GetFoodPlaceTypes()
        {
            return Ok(await _context.FoodPlaceTypes.ToListAsync());
        }

        [HttpGet]
        [Route("getAttractions")]
        public async Task<Object> GetAttractions()
        {
            return Ok(await _context.Attractions.ToListAsync());
        }

    }
}
