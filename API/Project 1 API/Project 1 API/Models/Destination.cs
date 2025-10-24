using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class Destination
{
    public int DestinationId { get; set; }

    public string DestinationName { get; set; } = null!;

    public string DestinationCountry { get; set; } = null!;

    public int DestinationRating { get; set; }

    public string DestinationDescription { get; set; } = null!;

    public int CountryId { get; set; }

    public string? DestinationImage { get; set; }
}
