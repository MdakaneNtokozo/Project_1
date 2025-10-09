using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class SelectedFoodPlace
{
    public int FoodpId { get; set; }

    public int VacId { get; set; }

    public int NumMealsADay { get; set; }

    public double EstimatedFoodPrice { get; set; }

    public virtual FoodPlace Foodp { get; set; } = null!;

    public virtual Vacation Vac { get; set; } = null!;
}
