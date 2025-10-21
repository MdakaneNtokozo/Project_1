using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Project_1_API.Models;
using System;
using System.Numerics;

namespace Project_1_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VacayPlansControllerr(Project1DatabaseContext context) : ControllerBase
    {
        private readonly Project1DatabaseContext _context = context;

        private Double GetExchangeRate(int destId, int currencyId)
        {
            //convert transportation prices to the user's preffered currency
            var currencies = _context.Currencies.ToList();
            var prefferedCurreny = currencies.Find(c => c.CurrencyId == currencyId);

            var destinations = _context.Destinations.ToList();
            var countryId = destinations.Find(d => d.DestinationId == destId)?.CountryId;

            var countries = _context.Countries.ToList();
            var destCurrId = countries.Find(c => c.CountryId == countryId)?.CurrencyId;
            var destinationCurrency = currencies.Find(c => c.CurrencyId == destCurrId);
            var er = 1.0;

            if (prefferedCurreny != destinationCurrency)
            {
                //get the exchange rate between the two currencies
                var rates =  _context.ExchangeRates.ToList();
                var rate = rates.Find(r => r.CurrentId == destinationCurrency?.CurrencyId && r.TargetId == prefferedCurreny?.CurrencyId);
                er = rate.ExchangeRate1;
            }

            return er;
        }

        [HttpGet]
        [Route("getPlanInfo/{userId}")]
        public Object GetPlans(int userId)
        {
            var info = new List<VacayInfo>();
            var users = _context.Users.ToList();
            var userPrefferedCurrencyId = users.Find(u => u.UserId == userId).CurrencyId;

            //get the vacation plans created by the user
            var createdPlans = _context.CreatedPlans.ToList();
            createdPlans = createdPlans.FindAll(p => p.UserId == userId);

            createdPlans.ForEach(plan =>
            {
                //Store the created plan
                var vacayInfo = new VacayInfo();
                vacayInfo.vacayPlan = plan;

                //Get the vacation details for the created plan
                var vacations = _context.Vacations.ToList();
                var vacation = vacations.Find(v => v.VacationId == plan.VacationId);
                vacayInfo.vacation = vacation;

                //Get the number of days left before the vacation
                TimeSpan dateDiff = vacation.VacationEndDate - vacation.VacationStartDate;
                var days = dateDiff.Days + 1;
                vacayInfo.vacayDaysLeft = days;

                GetBuddiesDetails(vacation, vacayInfo);
                GetTransportationDetails(vacation, vacayInfo, userPrefferedCurrencyId);
                GetAccommodationDetails(vacation, vacayInfo, userPrefferedCurrencyId);
                GetFoodSpotsDetails(vacation, vacayInfo, userPrefferedCurrencyId);
                GetAttractionsDetails(vacation, vacayInfo, userPrefferedCurrencyId);

                //Get destination for the created plan
                var destinations = _context.Destinations.ToList();
                var destId = -1;
                if(vacayInfo.transportations.Count != 0)
                {
                    destId = vacayInfo.transportations[0].DestinationId;
                }else if (vacayInfo.accommodations.Count != 0)
                {
                    destId = vacayInfo.accommodations[0].DestinationId;
                }
                else if (vacayInfo.foodSpots.Count != 0)
                {
                    destId = vacayInfo.foodSpots[0].DestinationId;
                }
                else if (vacayInfo.accommodations.Count != 0)
                {
                    destId = vacayInfo.accommodations[0].DestinationId;
                }

                var dest = destinations.Find(d => d.DestinationId == destId);
                vacayInfo.destination = dest;

                //Store the vacation plan info
                info.Add(vacayInfo);
            });

            return Ok(info);
        }

        private void GetBuddiesDetails(Vacation vacation, VacayInfo vacayInfo)
        {
            //Get the travel buddies
            var buddies = _context.TravelBuddies.ToList();
            buddies = buddies.FindAll(tb => tb.VacationId == vacation.VacationId);
            vacayInfo.buddies = buddies;

            //Get the details for the travel buddies 
            var users = _context.Users.ToList();
            var buddyDetails = new List<User>();
            buddies.ForEach(b =>
            {
                var buddy = users.Find(u => u.UserId == b.UserId);
                buddyDetails.Add(buddy);
            });
            vacayInfo.users = buddyDetails;
        }

        private void GetTransportationDetails(Vacation vacation, VacayInfo vacayInfo, int currencyId)
        {
            //Get the selected transportations
            var selectedTrans = _context.SelectedTransportations.ToList();
            selectedTrans = selectedTrans.FindAll(st => st.VacationId == vacation.VacationId);
            vacayInfo.selectedTrans = selectedTrans;

            //Get the details for the selected transportation
            var allTransportaion = _context.Transportations.ToList();
            var plansTransportation = new List<Transportation>();

            selectedTrans.ForEach(st =>
            {
                var transportation = allTransportaion.Find(t => t.TransportationId == st.TransportationId);
                plansTransportation.Add(transportation);
            });

            //return transportations in the user's preffered currency
            if (plansTransportation.Count != 0)
            {
                var destId = plansTransportation[0].DestinationId;
                var exchangeRate = GetExchangeRate(destId, currencyId);

                plansTransportation.ForEach(p =>
                {
                    p.TransportationPricePerPerson = Math.Round(p.TransportationPricePerPerson * exchangeRate, 2);
                });
            }
            
            vacayInfo.transportations = plansTransportation;
        }

        private void GetAccommodationDetails(Vacation vacation, VacayInfo vacayInfo, int currencyId)
        {
            //Get the selected accommodations
            var selectedAccoms = _context.SelectedAccommodations.ToList();
            selectedAccoms = selectedAccoms.FindAll(a => a.VacationId == vacation.VacationId);
            vacayInfo.selectedAccoms = selectedAccoms;

            //Get the details for the selected accommodation
            var allAccommodation = _context.Accommodations.ToList();
            var plansAccommodation = new List<Accommodation>();
            selectedAccoms.ForEach(sa =>
            {
                var accommodation = allAccommodation.Find(a => a.AccommodationId == sa.AccommodationId);
                plansAccommodation.Add(accommodation);
            });

            //return accommodations in the user's preffered currency
            if (plansAccommodation.Count != 0)
            {
                var destId = plansAccommodation[0].DestinationId;
                var exchangeRate = GetExchangeRate(destId, currencyId);

                plansAccommodation.ForEach(p =>
                {
                    p.AccommodationPricePerPerson = Math.Round(p.AccommodationPricePerPerson * exchangeRate);
                });
            }

            vacayInfo.accommodations = plansAccommodation;
        }

        private void GetFoodSpotsDetails(Vacation vacation, VacayInfo vacayInfo, int currencyId)
        {
            //Get the selected food spots
            var selectedSpots = _context.SelectedFoodSpots.ToList();
            selectedSpots = selectedSpots.FindAll(s => s.VacationId == vacation.VacationId);
            vacayInfo.selectedSpots = selectedSpots;

            //Get the details for the selected food spots
            var AllFoodSpots = _context.FoodSpots.ToList();
            var plansFoodSpots = new List<FoodSpot>();
            selectedSpots.ForEach(ss =>
            {
                var foodSpot = AllFoodSpots.Find(a => a.FoodSpotId == ss.FoodSpotId);
                plansFoodSpots.Add(foodSpot);
            });

            //return food spots in the user's preffered currency
            if (plansFoodSpots.Count != 0)
            {
                var destId = plansFoodSpots[0].DestinationId;
                var exchangeRate = GetExchangeRate(destId, currencyId);

                plansFoodSpots.ForEach(p =>
                {
                    p.FoodSpotMinMenuPrice = Math.Round(p.FoodSpotMinMenuPrice * exchangeRate, 2);
                    p.FoodSpotMaxMenuPrice = Math.Round(p.FoodSpotMaxMenuPrice * exchangeRate, 2);
                });
            }

            vacayInfo.foodSpots = plansFoodSpots;
        }

        private void GetAttractionsDetails(Vacation vacation, VacayInfo vacayInfo, int currencyId)
        {
            //Get the selected attractions
            var selectedAttrs = _context.SelectedAttractions.ToList();
            selectedAttrs = selectedAttrs.FindAll(s => s.VacationId == vacation.VacationId);
            vacayInfo.selectedAttrs = selectedAttrs;

            //Get the details for the selected attractions
            var AllAttractions = _context.Attractions.ToList();
            var plansAttractions = new List<Attraction>();
            selectedAttrs.ForEach(sa =>
            {
                var attraction = AllAttractions.Find(a => a.AttractionId == sa.AttractionId);
                plansAttractions.Add(attraction);
            });

            //return attractions in the user's preffered currency
            if (plansAttractions.Count != 0)
            {
                var destId = plansAttractions[0].DestinationId;
                var exchangeRate = GetExchangeRate(destId, currencyId);

                plansAttractions.ForEach(p =>
                {
                    p.AttractionEntranceFee = Math.Round(p.AttractionEntranceFee * exchangeRate, 2);
                });
            }

            vacayInfo.attractions = plansAttractions;
        }

    }
}
