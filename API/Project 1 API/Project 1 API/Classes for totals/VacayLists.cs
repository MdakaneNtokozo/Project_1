using Project_1_API.Models;

namespace Project_1_API.Classes_for_totals
{
    public class VacayLists
    {
        public User user { get; set; }
        public SpenderType type { get; set; }
        public List<User> travelBuddies { get; set; }    
        public List<TransNum> transSelected { get; set; }
        public List<AccommDates> accommSelected { get; set; }
        public List<SpotNum> spotsSelected { get; set;}
        public List<AttrNum> attrSelected { get; set; }
    }
}
