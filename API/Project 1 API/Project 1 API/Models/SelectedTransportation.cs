using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class SelectedTransportation
{
    public int TransportationId { get; set; }

    public int VacationId { get; set; }

    public int SelectedUseType { get; set; }

    public int NumOfTimes { get; set; }

    public double TransportationBudget { get; set; }

    

    
}
