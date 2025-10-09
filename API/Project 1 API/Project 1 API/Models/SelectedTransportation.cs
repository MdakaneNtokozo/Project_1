using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class SelectedTransportation
{
    public int TranspId { get; set; }

    public int VacId { get; set; }

    public double EstimatedTranspPrice { get; set; }

    public virtual Transportation Transp { get; set; } = null!;

    public virtual Vacation Vac { get; set; } = null!;
}
