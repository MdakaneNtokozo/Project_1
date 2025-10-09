using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class SelectedAccomodation
{
    public int AccId { get; set; }

    public int VacId { get; set; }

    public int NumOfNightsInAcc { get; set; }

    public double EstimatedAccPrice { get; set; }

    public virtual Accomodation Acc { get; set; } = null!;

    public virtual Vacation Vac { get; set; } = null!;
}
