using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Project_1_API.Models;
using System.Security.Cryptography;

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
        [Route("getCurrencies")]
        public async Task<Object> GetCurrencies()
        {
            return Ok(await _context.Currencies.ToListAsync());
        }

        [HttpGet]
        [Route("getCountries")]
        public async Task<Object> GetCountries()
        {
            return Ok(await _context.Countries.ToListAsync());
        }

        [HttpGet]
        [Route("getDestinations")]
        public async Task<Object> GetDestinations()
        {
            return Ok(await _context.Destinations.ToListAsync());
        }

        [HttpGet]
        [Route("getTopDestinations")]
        public async Task<Object> GetRandomTopDestinations()
        {
            var destinations = await _context.Destinations.ToListAsync();
            destinations = destinations.FindAll(f => f.DestinationRating == 5);
            var top3 = new List<Destination>();

            if (destinations.Count > 3)
            {
                var randomNum = new Random();
                int count = 3;

                while(count > 0)
                {
                    var index = randomNum.Next(0, destinations.Count);
                    var dest = destinations[index];

                    top3.Add(dest);
                    count--;
                    destinations.Remove(dest);
                }
            }
            else
            {
                top3.AddRange(destinations);
            }

                return Ok(top3);
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
        [Route("getSuggestedTransportation")]
        public async Task<Object> GetSuggestedTransportation(int spenderTypeId, int destinationId)
        {
            var spenderTypes = await _context.SpenderTypes.ToListAsync();
            var spenderType = spenderTypes.Find(t => t.SpenderTypeId == spenderTypeId);

            var transportations = await _context.Transportations.ToListAsync();
            var transInSpecifiedDestination = transportations.FindAll(t => t.DestinationId == destinationId);

            var min = transInSpecifiedDestination.Min(p => p.TransportationPricePerPerson);
            var max = transInSpecifiedDestination.Max(p => p.TransportationPricePerPerson);

            var priceRange = max - min;
            var level = spenderType.SpenderTypeLevel;
            var count = spenderTypes.Count;
            var result = priceRange  / count;

            var list = transInSpecifiedDestination.FindAll(t => t.TransportationPricePerPerson >= (min + (result * (level - 1))) && t.TransportationPricePerPerson <= ( min + (result * level)) );

            return Ok(list);
        }

        [HttpGet]
        [Route("getAccommodations")]
        public async Task<Object> GetAccommodations()
        {
            return Ok(await _context.Accommodations.ToListAsync());
        }

        [HttpGet]
        [Route("getAccommodationTypes")]
        public async Task<Object> GetAccommodationTypes()
        {
            return Ok(await _context.AccomodationTypes.ToListAsync());
        }

        [HttpGet]
        [Route("getSuggestedAccommodation")]
        public async Task<Object> GetSuggestedAccommodation(int spenderTypeId, int destinationId)
        {
            var spenderTypes = await _context.SpenderTypes.ToListAsync();
            var spenderType = spenderTypes.Find(t => t.SpenderTypeId == spenderTypeId);

            var accommodations = await _context.Accommodations.ToListAsync();
            var accommsInSpecifiedDestination = accommodations.FindAll(t => t.DestinationId == destinationId);

            var min = accommsInSpecifiedDestination.Min(p => p.AccommodationPricePerPerson);
            var max = accommsInSpecifiedDestination.Max(p => p.AccommodationPricePerPerson);

            var priceRange = max - min;
            var level = spenderType.SpenderTypeLevel;
            var count = spenderTypes.Count;
            var result = priceRange / count;

            var list = accommsInSpecifiedDestination.FindAll(a => a.AccommodationPricePerPerson >= (min + (result * (level - 1))) && a.AccommodationPricePerPerson <= (min + (result * level)));

            return Ok(list);
        }

        [HttpGet]
        [Route("getFoodSpots")]
        public async Task<Object> GetFoodSpots()
        {
            return Ok(await _context.FoodSpots.ToListAsync());
        }

        [HttpGet]
        [Route("getFoodSpotTypes")]
        public async Task<Object> GetFoodSpotTypes()
        {
            return Ok(await _context.FoodSpotTypes.ToListAsync());
        }

        [HttpGet]
        [Route("getSuggestedFoodSpot")]
        public async Task<Object> GetSuggestedFoodSpot(int spenderTypeId, int destinationId)
        {
            var spenderTypes = await _context.SpenderTypes.ToListAsync();
            var spenderType = spenderTypes.Find(t => t.SpenderTypeId == spenderTypeId);

            var foodSpots = await _context.FoodSpots.ToListAsync();
            var spotsInSpecifiedDestination = foodSpots.FindAll(t => t.DestinationId == destinationId);

            var min = spotsInSpecifiedDestination.Min(p => p.FoodSpotMaxMenuPrice);
            var max = spotsInSpecifiedDestination.Max(p => p.FoodSpotMaxMenuPrice);

            var priceRange = max - min;
            var level = spenderType.SpenderTypeLevel;
            var count = spenderTypes.Count;
            var result = priceRange / count;

            var list = spotsInSpecifiedDestination.FindAll(f => f.FoodSpotMaxMenuPrice >= (min + (result * (level - 1))) && f.FoodSpotMaxMenuPrice <= (min + (result * level)));

            return Ok(list);
        }

        [HttpGet]
        [Route("getAttractions")]
        public async Task<Object> GetAttractions()
        {
            return Ok(await _context.Attractions.ToListAsync());
        }

        [HttpGet]
        [Route("getSuggestedAttraction")]
        public async Task<Object> GetSuggestedAttraction(int spenderTypeId, int destinationId)
        {
            var spenderTypes = await _context.SpenderTypes.ToListAsync();
            var spenderType = spenderTypes.Find(t => t.SpenderTypeId == spenderTypeId);

            var attractions = await _context.Attractions.ToListAsync();
            var attrInSpecifiedDestination = attractions.FindAll(t => t.DestinationId == destinationId);

            var min = attrInSpecifiedDestination.Min(a => a.AttractionPricePerPerson);
            var max = attrInSpecifiedDestination.Max(a => a.AttractionPricePerPerson);

            var priceRange = max - min;
            var level = spenderType.SpenderTypeLevel;
            var count = spenderTypes.Count;
            var result = priceRange / count;

            var list = attrInSpecifiedDestination.FindAll(a => a.AttractionPricePerPerson >= (min + (result * (level - 1))) && a.AttractionPricePerPerson <= (min + (result * level)));

            return Ok(list);
        }

    }
}
