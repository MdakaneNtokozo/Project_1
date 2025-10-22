using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Project_1_API.Classes_for_totals;
using Project_1_API.Models;
using System;

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
        [Route("getDestinationById/{destId}")]
        public async Task<Object> GetDestinationById(int destId)
        {
            var destinations = await _context.Destinations.ToListAsync();
            var dest = destinations.Find(d => d.DestinationId == destId);

            return Ok();
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
                AddSelectedTrans(i, vacay, start, end, vacayTotal);
            });

            vcl.accommSelected.ForEach((i) =>
            {
                AddSelectedAccomm(i, vacay, start, end, vacayTotal);
            });

            vcl.spotsSelected.ForEach((i) =>
            {
                AddSelectedSpot(i, vacay, start, end, vacayTotal);
            });

            vcl.attrSelected.ForEach((i) =>
            {
                AddSelectedAttr(i, vacay, start, end, vacayTotal);
            });

            vcl.travelBuddies.ForEach((b) =>
            {
                AddTravelBuddy(b, vacay);
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

        private void AddSelectedTrans(TransNum i, Vacation vacay, DateTime start, DateTime end, double vacayTotal)
        {
            var selectedTrans = new SelectedTransportation();
            selectedTrans.TransportationId = i.trans.TransportationId;
            selectedTrans.VacationId = vacay.VacationId;
            selectedTrans.SelectedUseType = i.useType;
            selectedTrans.NumOfTimes = i.num;

            var transTotal = TransTotalCalculation(i, start, end);
            vacayTotal += transTotal;
            selectedTrans.TransportationBudget = transTotal;

            _context.SelectedTransportations.Add(selectedTrans);
            _context.SaveChanges();
        }

        private void AddSelectedAccomm(AccommDates i, Vacation vacay, DateTime start, DateTime end, double vacayTotal)
        {
            var selectedAccom = new SelectedAccommodation();
            selectedAccom.AccommodationId = i.accomm.AccommodationId;
            selectedAccom.VacationId = vacay.VacationId;
            selectedAccom.CheckInDate = i.dates[0];
            selectedAccom.CheckOutDate = i.dates[1];

            var accomTotal = AccomsTotalCalculation(i);
            vacayTotal += accomTotal;
            selectedAccom.AccommodationBudget = accomTotal;

            _context.SelectedAccommodations.Add(selectedAccom);
            _context.SaveChanges();
        }

        private void AddSelectedSpot(SpotNum i, Vacation vacay, DateTime start, DateTime end, double vacayTotal)
        {
            var selectedSpot = new SelectedFoodSpot();
            selectedSpot.FoodSpotId = i.spot.FoodSpotId;
            selectedSpot.VacationId = vacay.VacationId;
            selectedSpot.SelectedExperienceType = i.useType;
            selectedSpot.NumOfTimes = i.num;

            var spotTotal = SpotTotalCalculation(i, start, end);
            vacayTotal += spotTotal;
            selectedSpot.FoodSpotBudget = spotTotal;

            _context.SelectedFoodSpots.Add(selectedSpot);
            _context.SaveChanges();
        }

        private void AddSelectedAttr(AttrNum i, Vacation vacay, DateTime start, DateTime end, double vacayTotal)
        {
            var selectedAttr = new SelectedAttraction();
            selectedAttr.AttractionId = i.attr.AttractionId;
            selectedAttr.VacationId = vacay.VacationId;
            selectedAttr.SelectedExperienceType = i.useType;
            selectedAttr.NumOfTimes = i.num;

            var attrTotal = AttrTotalCalculation(i, start, end);
            vacayTotal += attrTotal;
            selectedAttr.AttractionBudget = attrTotal;

            _context.SelectedAttractions.Add(selectedAttr);
            _context.SaveChanges();
        }

        private void AddTravelBuddy(User b, Vacation vacay)
        {
            var travelBuddy = new TravelBuddy();
            travelBuddy.UserId = b.UserId;
            travelBuddy.VacationId = vacay.VacationId;
            travelBuddy.ViewedPlan = false;

            _context.TravelBuddies.Add(travelBuddy);
            _context.SaveChanges();
        }

        [HttpPut]
        [Route("updateVacayBudget")]
        public Object UpdateVacayBudget(VacayLists vcl, DateTime start, DateTime end)
        {
            var createdPlan = vcl.plan;
            var vacations = _context.Vacations.ToList();
            var vacation = vacations.Find(v => v.VacationId == createdPlan.VacationId);
            var vacayTotal = 0.0;

            //Check if vacation needs to be updated
            if (start != vacation.VacationStartDate)
            {
                vacation.VacationStartDate = start;
            }

            if (end != vacation.VacationEndDate)
            {
                vacation.VacationEndDate = end;
            }

            //Check if transportations have changed
            vacayTotal = UpdateSelectedTrans(vacation, vcl, start, end, vacayTotal);

            //Check if accommodations have changed
            vacayTotal = UpdateSelectedAccomm(vacation, vcl, start, end, vacayTotal);

            //Check if food spots have changed
            vacayTotal = UpdateSelectedSpots(vacation, vcl, start, end, vacayTotal);

            //Check if attractions have changed
            vacayTotal = UpdateSelectedAttrs(vacation, vcl, start, end, vacayTotal);

            //Check if travel buddies have changed
            UpdateTravelBuddies(vacation, vcl);

            //Now update the estimated budget for the vacation plan
            createdPlan.PlanBudget = vacayTotal;
            _context.CreatedPlans.Update(createdPlan);
            _context.SaveChanges();

            return Ok("Vacay plan has been updated");
        }

        private double UpdateSelectedTrans(Vacation vacation, VacayLists vcl, DateTime start, DateTime end, double vacayTotal)
        {
            var selectedTrans = _context.SelectedTransportations.ToList();
            selectedTrans = selectedTrans.FindAll(st => st.VacationId == vacation.VacationId);
            vcl.transSelected.ForEach(i =>
            {
                var selected = selectedTrans.Find(t => t.TransportationId == i.trans.TransportationId);

                if (selected != null)
                {
                    //Updating selected transportation that was previously added for the vacation plan

                    //Update the details for the selected transportation
                    if (selected.SelectedUseType != i.useType)
                    {
                        selected.SelectedUseType = i.useType;
                    }

                    if (selected.NumOfTimes != i.num)
                    {
                        selected.NumOfTimes = i.num;
                    }

                    //Update the budget calculated for the selected transportation
                    var transTotal = TransTotalCalculation(i, start, end);
                    selected.TransportationBudget = transTotal;
                    vacayTotal += transTotal;

                    //Update the databse
                    _context.SelectedTransportations.Update(selected);
                    _context.SaveChanges();

                    //Remove the checked selected transportation from the list
                    selectedTrans.Remove(selected);
                }
                else
                {
                    //New selected transportation has been found. Add it to the database
                    AddSelectedTrans(i, vacation, start, end, vacayTotal);
                }
            });

            if (selectedTrans.Count != 0)
            {
                //Not all previousy selected transportations have been added to the update
                _context.SelectedTransportations.RemoveRange(selectedTrans);
                _context.SaveChanges();
            }

            return vacayTotal;
        }

        private double UpdateSelectedAccomm(Vacation vacation, VacayLists vcl, DateTime start, DateTime end, double vacayTotal)
        {
            var selectedAccomm = _context.SelectedAccommodations.ToList();
            selectedAccomm = selectedAccomm.FindAll(sa => sa.VacationId == vacation.VacationId);
            vcl.accommSelected.ForEach(i =>
            {
                var selected = selectedAccomm.Find(a => a.AccommodationId == i.accomm.AccommodationId);

                if (selected != null)
                {
                    //Updating selected accommodated that was previously added for the vacation plan

                    //Update the details for the selected accommodation
                    if (selected.CheckInDate != i.dates[0])
                    {
                        selected.CheckInDate = i.dates[0];
                    }

                    if (selected.CheckOutDate != i.dates[1])
                    {
                        selected.CheckOutDate = i.dates[1];
                    }

                    //Update the budget calculated for the selected accommodation
                    var accommTotal = AccomsTotalCalculation(i);
                    selected.AccommodationBudget = accommTotal;
                    vacayTotal += accommTotal;

                    //Update the databse
                    _context.SelectedAccommodations.Update(selected);
                    _context.SaveChanges();

                    //Remove the checked selected accommodation from the list
                    selectedAccomm.Remove(selected);
                }
                else
                {
                    //New selected accommodation has been found. Add it to the database
                    AddSelectedAccomm(i, vacation, start, end, vacayTotal);
                }
            });

            if (selectedAccomm.Count != 0)
            {
                //Not all previousy selected accommodation have been added to the update
                _context.SelectedAccommodations.RemoveRange(selectedAccomm);
                _context.SaveChanges();
            }

            return vacayTotal;
        }

        private double UpdateSelectedSpots(Vacation vacation, VacayLists vcl, DateTime start, DateTime end, double vacayTotal)
        {
            var selectedSpots = _context.SelectedFoodSpots.ToList();
            selectedSpots = selectedSpots.FindAll(ss => ss.VacationId == vacation.VacationId);
            vcl.spotsSelected.ForEach(i =>
            {
                var selected = selectedSpots.Find(s => s.FoodSpotId == i.spot.FoodSpotId);

                if (selected != null)
                {
                    //Updating selected food spot that was previously added for the vacation plan

                    //Update the details for the selected food spot
                    if (selected.SelectedExperienceType != i.useType)
                    {
                        selected.SelectedExperienceType = i.useType;
                    }

                    if (selected.NumOfTimes != i.num)
                    {
                        selected.NumOfTimes = i.num;
                    }

                    //Update the budget calculated for the selected food spot
                    var spotTotal = SpotTotalCalculation(i, start, end);
                    selected.FoodSpotBudget = spotTotal;
                    vacayTotal += spotTotal;

                    //Update the databse
                    _context.SelectedFoodSpots.Update(selected);
                    _context.SaveChanges();

                    //Remove the checked selected food spot from the list
                    selectedSpots.Remove(selected);
                }
                else
                {
                    //New selected food spot has been found. Add it to the database
                    AddSelectedSpot(i, vacation, start, end, vacayTotal);
                }
            });

            if (selectedSpots.Count != 0)
            {
                //Not all previousy selected food spot have been added to the update
                _context.SelectedFoodSpots.RemoveRange(selectedSpots);
                _context.SaveChanges();
            }

            return vacayTotal;
        }

        private double UpdateSelectedAttrs(Vacation vacation, VacayLists vcl, DateTime start, DateTime end, double vacayTotal)
        {
            var selectedAttrs = _context.SelectedAttractions.ToList();
            selectedAttrs = selectedAttrs.FindAll(at => at.VacationId == vacation.VacationId);
            vcl.attrSelected.ForEach(i =>
            {
                var selected = selectedAttrs.Find(at => at.AttractionId == i.attr.AttractionId);

                if (selected != null)
                {
                    //Updating selected attraction that was previously added for the vacation plan

                    //Update the details for the selected attraction
                    if (selected.SelectedExperienceType != i.useType)
                    {
                        selected.SelectedExperienceType = i.useType;
                    }

                    if (selected.NumOfTimes != i.num)
                    {
                        selected.NumOfTimes = i.num;
                    }

                    //Update the budget calculated for the selected attraction
                    var attrTotal = AttrTotalCalculation(i, start, end);
                    selected.AttractionBudget = attrTotal;
                    vacayTotal += attrTotal;

                    //Update the databse
                    _context.SelectedAttractions.Update(selected);
                    _context.SaveChanges();

                    //Remove the checked selected attraction from the list
                    selectedAttrs.Remove(selected);
                }
                else
                {
                    //New selected attraction has been found. Add it to the database
                    AddSelectedAttr(i, vacation, start, end, vacayTotal);
                }
            });

            if (selectedAttrs.Count != 0)
            {
                //Not all previousy selected attraction have been added to the update
                _context.SelectedAttractions.RemoveRange(selectedAttrs);
                _context.SaveChanges();
            }

            return vacayTotal;
        }

        private void UpdateTravelBuddies(Vacation vacation, VacayLists vcl)
        {
            var selectedBuddies = _context.TravelBuddies.ToList();
            selectedBuddies = selectedBuddies.FindAll(tb => tb.VacationId == vacation.VacationId);
            vcl.travelBuddies.ForEach(i =>
            {
                var selected = selectedBuddies.Find(b => b.UserId == i.UserId);

                if (selected != null)
                {
                    //Updating selected transportation that was previously added for the vacation plan

                    //Remove the travel buddy from the list
                    selectedBuddies.Remove(selected);
                }
                else
                {
                    //New selected travel buddy has been found. Add them to the database
                    AddTravelBuddy(i, vacation);
                }
            });

            if (selectedBuddies.Count != 0)
            {
                //Not all previousy selected travel buddies have been added to the update
                _context.TravelBuddies.RemoveRange(selectedBuddies);
                _context.SaveChanges();
            }
        }

        [HttpDelete]
        [Route("deleteVacayBudget")]
        public Object DeleteVacayBudget(CreatedPlan vacayPlan)
        {
            //Remove the selected transportations
            var selectedTrans = _context.SelectedTransportations.ToList();
            selectedTrans = selectedTrans.FindAll(st => st.VacationId == vacayPlan.VacationId);
            _context.SelectedTransportations.RemoveRange(selectedTrans);
            _context.SaveChanges();

            //Remove the selected accommodations
            var selectedAccomm = _context.SelectedAccommodations.ToList();
            selectedAccomm = selectedAccomm.FindAll(ac => ac.VacationId == vacayPlan.VacationId);
            _context.SelectedAccommodations.RemoveRange(selectedAccomm);
            _context.SaveChanges();

            //Remove the selected food spots
            var selectedSpots = _context.SelectedFoodSpots.ToList();
            selectedSpots = selectedSpots.FindAll(sp => sp.VacationId == vacayPlan.VacationId);
            _context.SelectedFoodSpots.RemoveRange(selectedSpots);
            _context.SaveChanges();

            //Remove the selected attractions
            var selectedAttrs = _context.SelectedAttractions.ToList();
            selectedAttrs = selectedAttrs.FindAll(sa => sa.VacationId == vacayPlan.VacationId);
            _context.SelectedAttractions.RemoveRange(selectedAttrs);
            _context.SaveChanges();

            //Remove travel buddies
            var buddies = _context.TravelBuddies.ToList();
            buddies = buddies.FindAll(b => b.VacationId == vacayPlan.VacationId);
            _context.TravelBuddies.RemoveRange(buddies);
            _context.SaveChanges();

            //Finally, remove the created vaaction plan
            _context.CreatedPlans.Remove(vacayPlan);
            _context.SaveChanges();

            return Ok("Vacation plan has been deelted");
        }

        }
    }
