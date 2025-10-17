using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class FoodSpot
{
    public int FoodSpotId { get; set; }

    public string FoodSpotName { get; set; } = null!;

    public string FoodSpotAddress { get; set; } = null!;

    public int FoodSpotRating { get; set; }

    public double FoodSpotMinMenuPrice { get; set; }

    public double FoodSpotMaxMenuPrice { get; set; }

    public string FoodSpotMenuItems { get; set; } = null!;

    public int FoodSpotTypeId { get; set; }

    public int DestinationId { get; set; }

    public string? FoodSpotImage { get; set; }

    

    
}
