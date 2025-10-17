using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class Accommodation
{
    public int AccommodationId { get; set; }

    public string AccommodationName { get; set; } = null!;

    public string AccommodationAddress { get; set; } = null!;

    public int AccommodationRating { get; set; }

    public double AccommodationPricePerPerson { get; set; }

    public int AccommodationMinNumOfPeople { get; set; }

    public int AccommodationMaxNumOfPeople { get; set; }

    public string AccommodationAmenities { get; set; } = null!;

    public int AccommodationTypeId { get; set; }

    public int DestinationId { get; set; }

    public int AccomodationTypeId { get; set; }

    public string? AccommodationImage { get; set; }

    

    
}
