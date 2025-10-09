using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class VacationPlanCreated
{
    public int VacId { get; set; }

    public int UserId { get; set; }

    public DateTime PlanCreatedDate { get; set; }

    public DateTime PlanModifiedDate { get; set; }

    public int ExtraPeopleGoing { get; set; }

    public int SpenderTypeId { get; set; }

     

     

     

     
}
