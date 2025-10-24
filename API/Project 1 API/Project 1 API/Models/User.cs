using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class User
{
    public int UserId { get; set; }

    public string UserName { get; set; } = null!;

    public string UserSurname { get; set; } = null!;

    public string UserEmail { get; set; } = null!;

    public string UserBio { get; set; } = null!;

    public string UserPassword { get; set; } = null!;

    public DateTime UserCreatedDate { get; set; }

    public int CurrencyId { get; set; }
}
