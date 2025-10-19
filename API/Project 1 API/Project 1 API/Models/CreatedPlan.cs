using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class CreatedPlan
{
    public int VacationId { get; set; }

    public int UserId { get; set; }

    public double PlanBudget { get; set; }

    public DateTime PlanCreatedDate { get; set; }

    public DateTime PlanModifiedDate { get; set; }

    public int SpenderTypeId { get; set; }

    

    

    
}
