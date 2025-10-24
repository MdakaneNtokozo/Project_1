using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class SelectedFoodSpot
{
    public int FoodSpotId { get; set; }

    public int VacationId { get; set; }

    public int SelectedExperienceType { get; set; }

    public int NumOfTimes { get; set; }

    public double FoodSpotBudget { get; set; }
}
