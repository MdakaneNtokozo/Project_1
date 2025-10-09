using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class CreatedVacationPlan
{
    public int VacId { get; set; }

    public int UserId { get; set; }

    public DateTime PlanCreatedDate { get; set; }

    public DateTime PlanModifiedDate { get; set; }

    public int ExtraPeopleGoing { get; set; }

    public int SpenderTypeId { get; set; }

    

    public virtual SpenderType SpenderType { get; set; } = null!;

    public virtual User User { get; set; } = null!;

    public virtual Vacation Vac { get; set; } = null!;
}
