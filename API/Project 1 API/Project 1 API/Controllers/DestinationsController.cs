using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Project_1_API.Classes_for_totals;
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
            list.ForEach((t) => total += TransTotalCalculation(t, start, end));
            total = Math.Round(total, 2);
            return Ok(total);
        }

        public static int DaysCalculator(DateTime start, DateTime end)
        {
            TimeSpan dateDiff = end - start;
            var days = dateDiff.Days + 1;
            days = days == 0 ? 1 : days;

            return days;
        }

        private Double TransTotalCalculation(TransNum t, DateTime start, DateTime end)
        {
            var total = 0.0;

            if (t.useType == 1)
            {
                total += t.trans.TransportationPricePerPerson * t.num;
            }
            else if(t.useType == 2)
            {
                var days = DaysCalculator(start, end);
                total += t.trans.TransportationPricePerPerson * t.num * days;
            }

            return total;
        }

        [HttpPost]
        [Route("getAccomsTotal")]
        public Object GetAccomsTotal(List<AccommDates> list)
        {
            var total = 0.0;
            list.ForEach((a) => total += AccomsTotalCalculation(a));
            total = Math.Round(total, 2);
            return Ok(total);
        }

        private Double AccomsTotalCalculation(AccommDates a)
        {
            var total = 0.0;
            var days = DaysCalculator(a.dates[0], a.dates[1]);
            total = a.accomm.AccommodationPricePerPerson * days;

            return total;
        }

        [HttpPost]
        [Route("getFoodSpotsTotal")]
        public Object GetFoodSpotsTotal(DateTime start, DateTime end, List<SpotNum> list)
        {
            var total = 0.0;
            list.ForEach((s) => total += SpotTotalCalculation(s, start, end));
            total = Math.Round(total, 2);
            return Ok(total);
        }

        private Double SpotTotalCalculation(SpotNum s, DateTime start, DateTime end)
        {
            var total = 0.0;

            if (s.useType == 1)
            {
                total += s.spot.FoodSpotMaxMenuPrice * s.num;
            }
            else if (s.useType == 2)
            {
                var days = DaysCalculator(start, end);
                total += s.spot.FoodSpotMaxMenuPrice * s.num * days;
            }

            return total;
        }

        [HttpPost]
        [Route("getAttrsTotal")]
        public Object GetAttrsTotal(DateTime start, DateTime end, List<AttrNum> list)
        {
            var total = 0.0;
            list.ForEach((a) => total += AttrTotalCalculation(a, start, end));
            total = Math.Round(total, 2);
            return Ok(total);
        }

        private Double AttrTotalCalculation(AttrNum a, DateTime start, DateTime end)
        {
            var total = 0.0;

            if (a.useType == 1)
            {
                total += a.attr.AttractionEntranceFee * a.num;
            }
            else if (a.useType == 2)
            {
                var days = DaysCalculator(start, end);
                total += a.attr.AttractionEntranceFee * a.num * days;
            }

            return total;
        }

        [HttpPost]
        [Route("calVacayBudget")]
        public Object CalcVacayBudget( VacayLists vcl, DateTime start, DateTime end)
        {
            var vacayTotal = 0.0;

            //create a vacation plan 
            var plans = _context.Vacations.ToList();
            var lastIdx = 0;

            if (plans.Count != 0)
            {
                lastIdx = plans.Max(p => p.VacationId) + 1;
            }

            var vacay = new Vacation();
            vacay.VacationId = lastIdx;
            vacay.VacationStartDate = start;
            vacay.VacationEndDate = end;

            _context.Vacations.Add(vacay);
            _context.SaveChanges();

            //add the selected transportations
            vcl.transSelected.ForEach((i) =>
            {
                var selectedTrans = new SelectedTransportation();
                selectedTrans.TransportationId = i.trans.TransportationId;
                selectedTrans.VacationId = vacay.VacationId;
                selectedTrans.SelectedUseType = i.useType;

                var days = DaysCalculator(start, end);
                selectedTrans.NumOfTimes = selectedTrans.SelectedUseType == 1 ? i.num : i.num * days;

                var transTotal = TransTotalCalculation(i, start, end);
                vacayTotal += transTotal;
                selectedTrans.TransportationBudget = transTotal;

                _context.SelectedTransportations.Add(selectedTrans);
                _context.SaveChanges();
            });

            vcl.accommSelected.ForEach((i) =>
            {
                var selectedAccom = new SelectedAccommodation();
                selectedAccom.AccommodationId = i.accomm.AccommodationId;
                selectedAccom.VacationId = vacay.VacationId;

                var days = DaysCalculator(i.dates[0], i.dates[1]);
                selectedAccom.NumOfDays = days;

                var accomTotal = AccomsTotalCalculation(i);
                vacayTotal += accomTotal;
                selectedAccom.AccommodationBudget = accomTotal;

                _context.SelectedAccommodations.Add(selectedAccom);
                _context.SaveChanges();
            });

            vcl.spotsSelected.ForEach((i) =>
            {
                var selectedSpot = new SelectedFoodSpot();
                selectedSpot.FoodSpotIdId = i.spot.FoodSpotId;
                selectedSpot.VacationId = vacay.VacationId;
                selectedSpot.SelectedExperienceType = i.useType;

                var days = DaysCalculator(start, end);
                selectedSpot.NumOfTimes = selectedSpot.SelectedExperienceType == 1 ? i.num : i.num * days; ;

                var spotTotal = SpotTotalCalculation(i, start, end);
                vacayTotal += spotTotal;
                selectedSpot.FoodSpotBudget = spotTotal;

                _context.SelectedFoodSpots.Add(selectedSpot);
                _context.SaveChanges();
            });

            vcl.attrSelected.ForEach((i) =>
            {
                var selectedAttr = new SelectedAttraction();
                selectedAttr.AttractionId = i.attr.AttractionId;
                selectedAttr.VacationId = vacay.VacationId;
                selectedAttr.SelectedExperienceType = i.useType;

                var days = DaysCalculator(start, end);
                selectedAttr.NumOfTimes = selectedAttr.SelectedExperienceType == 1 ? i.num : i.num * days;

                var attrTotal = AttrTotalCalculation(i, start, end);
                vacayTotal += attrTotal;
                selectedAttr.AttractionBudget = attrTotal;

                _context.SelectedAttractions.Add(selectedAttr);
                _context.SaveChanges();
            });

            vcl.travelBuddies.ForEach((b) =>
            {
                var travelBuddy = new TravelBuddy();
                travelBuddy.UserId = b.UserId;
                travelBuddy.VacationId = vacay.VacationId;
                travelBuddy.ViewedPlan = false;

                _context.TravelBuddies.Add(travelBuddy);
                _context.SaveChanges();
            });

            //Finally, add the created vacation plan
            var createdPlan = new CreatedPlan();

            createdPlan.UserId = vcl.user.UserId;
            createdPlan.VacationId = vacay.VacationId;
            createdPlan.PlanCreatedDate = DateTime.Now;
            createdPlan.PlanModifiedDate = DateTime.Now;
            createdPlan.PlanBudget = vacayTotal;
            createdPlan.SpenderTypeId = vcl.type.SpenderTypeId;
           
            _context.CreatedPlans.Add(createdPlan);
            _context.SaveChanges();

            return Ok("Vacay plan has been saved");
        }

        

    }
}
