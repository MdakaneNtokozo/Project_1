using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class AddedToVacation
{
    public int VacId { get; set; }

    public int UserId { get; set; }

    public ulong ViewedVac { get; set; }

    public virtual User User { get; set; } = null!;

    public virtual Vacation Vac { get; set; } = null!;
}
