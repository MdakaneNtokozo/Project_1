using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class TransportationType
{
    public int TransportationTypeId { get; set; }

    public string TransportationTypeName { get; set; } = null!;
}
