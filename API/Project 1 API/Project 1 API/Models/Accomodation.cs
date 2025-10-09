using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class Accomodation
{
    public int AccId { get; set; }

    public string AccName { get; set; } = null!;

    public string AccAddress { get; set; } = null!;

    public double AccMinPrice { get; set; }

    public double AccMaxPrice { get; set; }

    public int AccMaxNumOfPeople { get; set; }

    public int AccTypeId { get; set; }

    public int DestId { get; set; }

    public virtual AccomodationType AccType { get; set; } = null!;

    public virtual Destination Dest { get; set; } = null!;

    
}
