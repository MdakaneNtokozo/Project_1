using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class SelectedAccommodation
{
    public int AccommodationId { get; set; }

    public int VacationId { get; set; }

    public DateTime CheckInDate { get; set; }

    public DateTime CheckOutDate { get; set; }

    public double AccommodationBudget { get; set; }

    

    
}
