using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class Error
{
    public int ErrId { get; set; }

    public string DeviceErrOccured { get; set; } = null!;

    public DateTime ErrDateOccured { get; set; }

    public ulong ErrResolved { get; set; }

    public int ErrTypeId { get; set; }

    public int UserId { get; set; }

    public int AdminId { get; set; }

    

    

    
}
