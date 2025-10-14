using System;
using System.Collections.Generic;

namespace Project_1_API.Models;

public partial class Suggestion
{
    public int SuggId { get; set; }

    public string SuggDetails { get; set; } = null!;

    public DateTime SuggDateRecorded { get; set; }

    public ulong SuggAdded { get; set; }

    public int UserId { get; set; }

    public int AdminId { get; set; }

    

    
}
