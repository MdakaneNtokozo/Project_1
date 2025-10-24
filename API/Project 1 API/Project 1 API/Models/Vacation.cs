using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class Vacation
{
    public int VacationId { get; set; }

    public DateTime VacationStartDate { get; set; }

    public DateTime VacationEndDate { get; set; }
}
