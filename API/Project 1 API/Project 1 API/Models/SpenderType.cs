using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class SpenderType
{
    public int SpenderTypeId { get; set; }

    public string SpenderTypeName { get; set; } = null!;

    public int SpenderTypeLevel { get; set; }

    
}
