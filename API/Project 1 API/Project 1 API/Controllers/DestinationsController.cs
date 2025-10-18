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
        [Route("getCurrency")]
        public async Task<Object> GetCurrencyById(int currencyId)
        {
            var currencies = await _context.Currencies.ToListAsync();
            var currency = currencies.Find(c => c.CurrencyId == currencyId);

            return Ok(currency);
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
        [Route("getTransportations/")]
        public async Task<Object> GetTransportaions(int destId, int currencyId)
        {
            var transportations = await _context.Transportations.ToListAsync();
            transportations = transportations.FindAll(t => t.DestinationId  == destId);
            var exchangeRateVal = await GetExchangeRate(destId, currencyId);
            transportations.ForEach( t => {
                    t.TransportationPricePerPerson = Math.Round( t.TransportationPricePerPerson * exchangeRateVal, 2);
                }) ;

            
            return Ok(transportations);
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
        public async Task<Object> GetAccommodations(int destId, int currencyId)
        {
            var accommodations = await _context.Accommodations.ToListAsync();
            accommodations = accommodations.FindAll(a => a.DestinationId == destId);
            var exchangeRateVal = await GetExchangeRate(destId, currencyId);
            accommodations.ForEach(a => {
                    a.AccommodationPricePerPerson = Math.Round(a.AccommodationPricePerPerson * exchangeRateVal, 2);
                });

            return Ok(accommodations);
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
        public async Task<Object> GetFoodSpots(int destId, int currencyId)
        {
            var foodSpots = await _context.FoodSpots.ToListAsync();
            foodSpots = foodSpots.FindAll(s => s.DestinationId == destId);

            var exchangeRateVal = await GetExchangeRate(destId, currencyId);
            foodSpots.ForEach(s => {
                    s.FoodSpotMinMenuPrice = Math.Round(s.FoodSpotMinMenuPrice * exchangeRateVal, 2);
                    s.FoodSpotMaxMenuPrice = Math.Round(s.FoodSpotMaxMenuPrice * exchangeRateVal, 2);
                });

            return Ok(foodSpots);
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

            var min = spotsInSpecifiedDestination.Min(p => p.FoodSpotMinMenuPrice);
            var max = spotsInSpecifiedDestination.Max(p => p.FoodSpotMinMenuPrice);

            var priceRange = max - min;
            var level = spenderType.SpenderTypeLevel;
            var count = spenderTypes.Count;
            var result = priceRange / count;

            var list = spotsInSpecifiedDestination.FindAll(f => f.FoodSpotMinMenuPrice >= (min + (result * (level - 1))) && f.FoodSpotMinMenuPrice <= (min + (result * level)));

            return Ok(list);
        }

        [HttpGet]
        [Route("getAttractions")]
        public async Task<Object> GetAttractions(int destId, int currencyId)
        {
            var attractions = await _context.Attractions.ToListAsync();
            attractions = attractions.FindAll(a => a.DestinationId == destId);
            var exchangeRateVal = await GetExchangeRate(destId, currencyId);

            attractions.ForEach(a => {
                a.AttractionEntranceFee = Math.Round(a.AttractionEntranceFee * exchangeRateVal, 2);
            });

            return Ok(attractions);
        }

        private async Task<Double> GetExchangeRate(int destId, int currencyId)
        {
            //convert transportation prices to the user's preffered currency
            var currencies = await _context.Currencies.ToListAsync();
            var prefferedCurreny = currencies.Find(c => c.CurrencyId == currencyId);

            var destinations = await _context.Destinations.ToListAsync();
            var countryId = destinations.Find(d => d.DestinationId == destId)?.CountryId;

            var countries = await _context.Countries.ToListAsync();
            var destCurrId = countries.Find(c => c.CountryId == countryId)?.CurrencyId;
            var destinationCurrency = currencies.Find(c => c.CurrencyId == destCurrId);
            var er = 1.0;

            if (prefferedCurreny != destinationCurrency)
            {
                //get the exchange rate between the two currencies
                var rates = await _context.ExchangeRates.ToListAsync();
                var rate = rates.Find(r => r.CurrentId == destinationCurrency?.CurrencyId && r.TargetId == prefferedCurreny?.CurrencyId);
                er = rate.ExchangeRate1;
            }

            return er;
        }

        [HttpGet]
        [Route("getSuggestedAttraction")]
        public async Task<Object> GetSuggestedAttraction(int spenderTypeId, int destinationId)
        {
            var spenderTypes = await _context.SpenderTypes.ToListAsync();
            var spenderType = spenderTypes.Find(t => t.SpenderTypeId == spenderTypeId);

            var attractions = await _context.Attractions.ToListAsync();
            var attrInSpecifiedDestination = attractions.FindAll(t => t.DestinationId == destinationId);

            var min = attrInSpecifiedDestination.Min(a => a.AttractionEntranceFee);
            var max = attrInSpecifiedDestination.Max(a => a.AttractionEntranceFee);

            var priceRange = max - min;
            var level = spenderType.SpenderTypeLevel;
            var count = spenderTypes.Count;
            var result = priceRange / count;

            var list = attrInSpecifiedDestination.FindAll(a => a.AttractionEntranceFee >= (min + (result * (level - 1))) && a.AttractionEntranceFee <= (min + (result * level)));

            return Ok(list);
        }

        [HttpPost]
        [Route("getTransTotal")]
        public Object GetTransTotal(DateTime start, DateTime end, List<TransNum> list)
        {
            
            var total = 0.0;

            list.ForEach((t) =>
            {
                if (t.num == 1)
                {
                    //One time use chosen
                    total += t.trans.TransportationPricePerPerson;
                }else if (t.num == 2) {
                    total += t.trans.TransportationPricePerPerson * 2;
                }
                else if(t.num == 3)
                {
                    //Everyday use chosen
                    TimeSpan dateDiff = end - start;
                    var days = dateDiff.Days;
                    days = days == 0 ? 1 : days;
                    total += t.trans.TransportationPricePerPerson * days * 2; //traveling everday taking two way trips
                }
            });

            return Ok(total);
        }

        [HttpPost]
        [Route("getAccomsTotal")]
        public Object GetAccomsTotal(DateTime start, DateTime end, List<AccommNum> list)
        {
            var total = 0.0;

            list.ForEach((a) =>
            {
                    TimeSpan dateDiff = end - start;
                    var days = dateDiff.Days;
                    days = days == 0 ? 1 : days;
                    total += a.accomm.AccommodationPricePerPerson * a.num;
                
            });

            return Ok(total);
        }

        [HttpPost]
        [Route("getFoodSpotsTotal")]
        public Object GetFoodSpotsTotal(DateTime start, DateTime end, List<SpotNum> list)
        {
            var total = 0.0;

            list.ForEach((t) =>
            {
                if (t.num == 1)
                {
                    //Trying out the food spot once
                    total += t.spot.FoodSpotMaxMenuPrice;
                }
                else if (t.num == 2)
                {
                    //Food eaten multiple times 
                    TimeSpan dateDiff = end - start;
                    var days = dateDiff.Days;
                    days = days == 0 ? 1 : days;
                    total += t.spot.FoodSpotMaxMenuPrice * days * 3; //Eating 3 meals a day everyday
                }
            });

            return Ok(total);
        }

        [Route("getAttrsTotal")]
        public Object GetAttrsTotal(DateTime start, DateTime end, List<AttrNum> list)
        {
            var total = 0.0;

            list.ForEach((t) =>
            {
                if (t.num == 1)
                {
                    //Trying out the attraction spot once
                    total += t.attr.AttractionEntranceFee;
                }
                else if (t.num == 2)
                {
                    //Try out the attraction multiple times 
                    TimeSpan dateDiff = end - start;
                    var days = dateDiff.Days;
                    days = days == 0 ? 1 : days;
                    total += t.attr.AttractionEntranceFee * days ;
                }
            });

            return Ok(total);
        }

    }
}
