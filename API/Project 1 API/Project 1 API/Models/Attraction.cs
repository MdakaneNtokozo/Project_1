using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class Attraction
{
    public int AttractionId { get; set; }

    public string AttractionName { get; set; } = null!;

    public string AttractionAddress { get; set; } = null!;

    public string AttractionRating { get; set; } = null!;

    public double AttractionEntranceFee { get; set; }

    public double AttractionPricePerPerson { get; set; }

    public bool AttractionTimeLimited { get; set; }

    public string AttractionDescription { get; set; } = null!;

    public int DestinationId { get; set; }

    public string? AttractionImage { get; set; }

    

    
}
