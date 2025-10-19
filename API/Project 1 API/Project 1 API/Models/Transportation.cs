using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class Transportation
{
    public int TransportationId { get; set; }

    public string TransportationName { get; set; } = null!;

    public double TransportationPricePerPerson { get; set; }

    public int TransportationMinPeople { get; set; }

    public int TransportationMaxPeople { get; set; }

    public int TransportationRating { get; set; }

    public int TransportationTypeId { get; set; }

    public int DestinationId { get; set; }

    public string? TransportationImage { get; set; }

    

    

    
}
