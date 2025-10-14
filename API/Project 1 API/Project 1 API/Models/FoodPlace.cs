using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class FoodPlace
{
    public int FoodpId { get; set; }

    public string FoodpName { get; set; } = null!;

    public string FoodpAddress { get; set; } = null!;

    public double FoodpMinPrice { get; set; }

    public double FoodpMaxPrice { get; set; }

    public string FoodpMenuItems { get; set; } = null!;

    public int FoodpRating { get; set; }

    public int FoodpTypeId { get; set; }

    public int DestId { get; set; }

    

    

    
}
