using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Project_1_API.Models;

namespace Project_1_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VacayPlansControllerr(Project1DatabaseContext context) : ControllerBase
    {
        private readonly Project1DatabaseContext _context = context;

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
        [Route("getVacayPlans/{userId}")]
        public async Task<Object> GetVacayPlans(int userId)
        {
            var createdPlans = await _context.CreatedPlans.ToListAsync();
            createdPlans = createdPlans.FindAll(p => p.UserId == userId);
            return Ok(createdPlans);
        }

        [HttpGet]
        [Route("getPlanInfo/{userId}")]
        public Object GetPlanInfo(int userId)
        {
            var destInfo = new List<VacayInfo>();

            var createdPlans = _context.CreatedPlans.ToList();
            createdPlans = createdPlans.FindAll(p => p.UserId == userId);
            var selectedTrans = _context.SelectedTransportations.ToList();
            var destinations = _context.Destinations.ToList();

            createdPlans.ForEach(c =>
            {
                var selecetdTrans = selectedTrans.Find(t => t.VacationId == c.VacationId);
                var transportations = _context.Transportations.ToList();
                var trans = transportations.Find(tr => tr.TransportationId == selecetdTrans.TransportationId);
                var dest = destinations.Find(d => d.DestinationId == trans.DestinationId);
                var vacations = _context.Vacations.ToList();
                var vac = vacations.Find(v => v.VacationId == c.VacationId);

                var info = new VacayInfo();
                info.vacationId = vac.VacationId;
                info.vacayDestId = dest.DestinationId;
                info.vacayDestName = dest.DestinationName;
                int daysLeft = DestinationsController.DaysCalculator(DateTime.Now, vac.VacationStartDate);
                info.vacayDaysLeft = daysLeft;

                destInfo.Add(info);
            });

            return Ok(destInfo);
        }

        [HttpGet]
        [Route("getTransportations")]
        public async Task<Object> GetTransportation(int vacationId, int destId, int currencyId) { 
            var selectedTrans = await _context.SelectedTransportations.ToListAsync();
            selectedTrans = selectedTrans.FindAll(t => t.VacationId == vacationId);
            var transportations = _context.Transportations.ToList();
            var transToReturn = new List<Transportation>();

            selectedTrans.ForEach((st) =>
            {
                var trans = transportations.Find(t => t.TransportationId == st.TransportationId);
                transToReturn.Add(trans);
            });

            var exchangeRate = await GetExchangeRate(destId, currencyId);
            transToReturn.ForEach((t) =>
            {
                t.TransportationPricePerPerson = t.TransportationPricePerPerson * exchangeRate;
            });

            return transToReturn;
        }

        [HttpGet]
        [Route("getAccommodations")]
        public async Task<Object> GetAccommodations(int vacationId, int destId, int currencyId)
        {
            var selectedAccomms = await _context.SelectedAccommodations.ToListAsync();
            selectedAccomms = selectedAccomms.FindAll(a => a.VacationId == vacationId);
            var accommodations = _context.Accommodations.ToList();
            var accommsToReturn = new List<Accommodation>();

            selectedAccomms.ForEach((ac) =>
            {
                var accomm = accommodations.Find(a => a.AccommodationId == ac.AccommodationId);
                accommsToReturn.Add(accomm);
            });

            var exchangeRate = await GetExchangeRate(destId, currencyId);
            accommsToReturn.ForEach((a) =>
            {
                a.AccommodationPricePerPerson = a.AccommodationPricePerPerson * exchangeRate;
            });

            return accommsToReturn;
        }

        [HttpGet]
        [Route("getFoodSpots")]
        public async Task<Object> GetFoodSpots(int vacationId, int destId, int currencyId)
        {
            var selectedSpots = await _context.SelectedFoodSpots.ToListAsync();
            selectedSpots = selectedSpots.FindAll(s => s.VacationId == vacationId);
            var foodSpots = _context.FoodSpots.ToList();
            var spotsToReturn = new List<FoodSpot>();

            selectedSpots.ForEach((fs) =>
            {
                var spot = foodSpots.Find(s => s.FoodSpotId == fs.FoodSpotIdId);
                spotsToReturn.Add(spot);
            });

            var exchangeRate = await GetExchangeRate(destId, currencyId);
            spotsToReturn.ForEach((s) =>
            {
                s.FoodSpotMinMenuPrice = s.FoodSpotMinMenuPrice * exchangeRate;
                s.FoodSpotMaxMenuPrice = s.FoodSpotMaxMenuPrice * exchangeRate;
            });

            return spotsToReturn;
        }

        [HttpGet]
        [Route("getAttractions")]
        public async Task<Object> GetAttractions(int vacationId, int destId, int currencyId)
        {
            var selectedAttrs = await _context.SelectedAttractions.ToListAsync();
            selectedAttrs = selectedAttrs.FindAll(a => a.VacationId == vacationId);
            var attractions = _context.Attractions.ToList();
            var attrsToReturn = new List<Attraction>();

            selectedAttrs.ForEach((at) =>
            {
                var attr = attractions.Find(a => a.AttractionId == at.AttractionId);
                attrsToReturn.Add(attr);
            });

            var exchangeRate = await GetExchangeRate(destId, currencyId);
            attrsToReturn.ForEach((a) =>
            {
                a.AttractionEntranceFee = a.AttractionEntranceFee * exchangeRate;
            });

            return attrsToReturn;
        }
    }
}
