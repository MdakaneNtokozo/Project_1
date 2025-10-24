using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class ExchangeRate
{
    public int CurrentId { get; set; }

    public int TargetId { get; set; }

    public double ExchangeRate1 { get; set; }
}
