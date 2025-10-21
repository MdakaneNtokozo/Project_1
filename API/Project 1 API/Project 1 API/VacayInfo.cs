using Project_1_API.Models;

namespace Project_1_API
{
    public class VacayInfo
    {
        public CreatedPlan vacayPlan {  get; set; } 
        public Vacation vacation { get; set; }
        public Destination destination { get; set; }
        public int vacayDaysLeft { get; set; }
        public List<TravelBuddy> buddies { get; set; }
        public List<User> users {get; set;}
        public List<SelectedTransportation> selectedTrans { get; set; }
        public List<Transportation> transportations { get; set; }
        public List<SelectedAccommodation> selectedAccoms { get; set; }
        public List<Accommodation> accommodations { get; set; }
        public List<SelectedFoodSpot> selectedSpots { get; set; }
        public List<FoodSpot> foodSpots { get; set; }
        public List<SelectedAttraction> selectedAttrs { get; set; }
        public List<Attraction> attractions { get; set; }
    }
}
