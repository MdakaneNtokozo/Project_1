using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class SelectedAttraction
{
    public int AttrId { get; set; }

    public int VacId { get; set; }

    public double EstimatedActivityPrice { get; set; }

    public virtual Attraction Attr { get; set; } = null!;

    public virtual Vacation Vac { get; set; } = null!;
}
