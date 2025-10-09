using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class Notification
{
    public int NotiId { get; set; }

    public string NotiTitle { get; set; } = null!;

    public string NotiMessage { get; set; } = null!;

    public DateTime NotiCreatedDate { get; set; }

    public ulong NotiIsRead { get; set; }

    public int VacId { get; set; }

    public int UserId { get; set; }

    public virtual CreatedVacationPlan CreatedVacationPlan { get; set; } = null!;
}
