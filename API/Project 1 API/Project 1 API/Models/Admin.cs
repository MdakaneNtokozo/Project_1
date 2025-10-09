using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class Admin
{
    public int AdminId { get; set; }

    public string AdminName { get; set; } = null!;

    public string AdminSurname { get; set; } = null!;

    public string AdminEmail { get; set; } = null!;

    public string AdminPassword { get; set; } = null!;

    

    
}
