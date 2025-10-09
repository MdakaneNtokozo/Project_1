using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class Transportation
{
    public int TranspId { get; set; }

    public string TranspName { get; set; } = null!;

    public double TranspMinPrice { get; set; }

    public double TranspMaxPrice { get; set; }

    public int TranspTypeId { get; set; }

    public int DestId { get; set; }

    public virtual Destination Dest { get; set; } = null!;

    

    public virtual TransportationType TranspType { get; set; } = null!;
}
