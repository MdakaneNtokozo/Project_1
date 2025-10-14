using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class Attraction
{
    public int AttrId { get; set; }

    public string AttrName { get; set; } = null!;

    public string AttrAddress { get; set; } = null!;

    public double AttrMinPrice { get; set; }

    public double AttrMaxPrice { get; set; }

    public int DestId { get; set; }

    

    
}
