using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class ErrorType
{
    public int ErrTypeId { get; set; }

    public string ErrTypeName { get; set; } = null!;

    public int ErrTypeLevel { get; set; }

    
}
