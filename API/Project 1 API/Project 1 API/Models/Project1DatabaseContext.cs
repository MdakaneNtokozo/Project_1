using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Pomelo.EntityFrameworkCore.MySql.Scaffolding.Internal;

namespace Project_1_API.Models;

public partial class Project1DatabaseContext : DbContext
{
    public Project1DatabaseContext()
    {
    }

    public Project1DatabaseContext(DbContextOptions<Project1DatabaseContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Accomodation> Accomodations { get; set; }

    public virtual DbSet<AccomodationType> AccomodationTypes { get; set; }

    public virtual DbSet<AddedToVacation> AddedToVacations { get; set; }

    public virtual DbSet<Admin> Admins { get; set; }

    public virtual DbSet<Attraction> Attractions { get; set; }

    public virtual DbSet<CreatedVacationPlan> CreatedVacationPlans { get; set; }

    public virtual DbSet<Currency> Currencies { get; set; }

    public virtual DbSet<Destination> Destinations { get; set; }

    public virtual DbSet<DestinationRating> DestinationRatings { get; set; }

    public virtual DbSet<Error> Errors { get; set; }

    public virtual DbSet<ErrorType> ErrorTypes { get; set; }

    public virtual DbSet<FoodPlace> FoodPlaces { get; set; }

    public virtual DbSet<FoodPlaceType> FoodPlaceTypes { get; set; }

    public virtual DbSet<Notification> Notifications { get; set; }

    public virtual DbSet<SelectedAccomodation> SelectedAccomodations { get; set; }

    public virtual DbSet<SelectedAttraction> SelectedAttractions { get; set; }

    public virtual DbSet<SelectedFoodPlace> SelectedFoodPlaces { get; set; }

    public virtual DbSet<SelectedTransportation> SelectedTransportations { get; set; }

    public virtual DbSet<SpenderType> SpenderTypes { get; set; }

    public virtual DbSet<Suggestion> Suggestions { get; set; }

    public virtual DbSet<Transportation> Transportations { get; set; }

    public virtual DbSet<TransportationType> TransportationTypes { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<Vacation> Vacations { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseMySql("server=localhost;database=project_1_database;uid=root;pwd=juniorDevHere.53", Microsoft.EntityFrameworkCore.ServerVersion.Parse("8.0.43-mysql"));

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder
            .UseCollation("utf8mb4_0900_ai_ci")
            .HasCharSet("utf8mb4");

        modelBuilder.Entity<Accomodation>(entity =>
        {
            entity.HasKey(e => e.AccId).HasName("PRIMARY");

            entity.ToTable("accomodation");

            entity.HasIndex(e => e.AccTypeId, "acc_type_id");

            entity.HasIndex(e => e.DestId, "dest_id");

            entity.Property(e => e.AccId)
                .ValueGeneratedNever()
                .HasColumnName("acc_id");
            entity.Property(e => e.AccAddress)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("acc_address");
            entity.Property(e => e.AccMaxNumOfPeople).HasColumnName("acc_max_num_of_people");
            entity.Property(e => e.AccMaxPrice).HasColumnName("acc_max_price");
            entity.Property(e => e.AccMinPrice).HasColumnName("acc_min_price");
            entity.Property(e => e.AccName)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("acc_name");
            entity.Property(e => e.AccTypeId).HasColumnName("acc_type_id");
            entity.Property(e => e.DestId).HasColumnName("dest_id");

            

            
        });

        modelBuilder.Entity<AccomodationType>(entity =>
        {
            entity.HasKey(e => e.AccTypeId).HasName("PRIMARY");

            entity.ToTable("accomodation_type");

            entity.Property(e => e.AccTypeId)
                .ValueGeneratedNever()
                .HasColumnName("acc_type_id");
            entity.Property(e => e.AccTypeName)
                .HasMaxLength(50)
                .IsFixedLength()
                .HasColumnName("acc_type_name");
        });

        modelBuilder.Entity<AddedToVacation>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("added_to_vacation");

            entity.HasIndex(e => e.UserId, "user_id");

            entity.HasIndex(e => e.VacId, "vac_id");

            entity.Property(e => e.UserId).HasColumnName("user_id");
            entity.Property(e => e.VacId).HasColumnName("vac_id");
            entity.Property(e => e.ViewedVac)
                .HasColumnType("bit(1)")
                .HasColumnName("viewed_vac");

            

            
        });

        modelBuilder.Entity<Admin>(entity =>
        {
            entity.HasKey(e => e.AdminId).HasName("PRIMARY");

            entity.ToTable("admin");

            entity.Property(e => e.AdminId)
                .ValueGeneratedNever()
                .HasColumnName("admin_id");
            entity.Property(e => e.AdminEmail)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("admin_email");
            entity.Property(e => e.AdminName)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("admin_name");
            entity.Property(e => e.AdminPassword)
                .HasColumnType("text")
                .HasColumnName("admin_password");
            entity.Property(e => e.AdminSurname)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("admin_surname");
        });

        modelBuilder.Entity<Attraction>(entity =>
        {
            entity.HasKey(e => e.AttrId).HasName("PRIMARY");

            entity.ToTable("attraction");

            entity.HasIndex(e => e.DestId, "dest_id");

            entity.Property(e => e.AttrId)
                .ValueGeneratedNever()
                .HasColumnName("attr_id");
            entity.Property(e => e.AttrAddress)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("attr_address");
            entity.Property(e => e.AttrMaxPrice).HasColumnName("attr_max_price");
            entity.Property(e => e.AttrMinPrice).HasColumnName("attr_min_price");
            entity.Property(e => e.AttrName)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("attr_name");
            entity.Property(e => e.DestId).HasColumnName("dest_id");

            
        });

        modelBuilder.Entity<CreatedVacationPlan>(entity =>
        {
            entity.HasKey(e => new { e.VacId, e.UserId })
                .HasName("PRIMARY")
                .HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0 });

            entity.ToTable("created_vacation_plan");

            entity.HasIndex(e => e.SpenderTypeId, "spender_type_id");

            entity.HasIndex(e => e.UserId, "user_id");

            entity.Property(e => e.VacId).HasColumnName("vac_id");
            entity.Property(e => e.UserId).HasColumnName("user_id");
            entity.Property(e => e.ExtraPeopleGoing).HasColumnName("extra_people_going");
            entity.Property(e => e.PlanCreatedDate)
                .HasColumnType("datetime")
                .HasColumnName("plan_created_date");
            entity.Property(e => e.PlanModifiedDate)
                .HasColumnType("datetime")
                .HasColumnName("plan_modified_date");
            entity.Property(e => e.SpenderTypeId).HasColumnName("spender_type_id");

            

            

            
        });

        modelBuilder.Entity<Currency>(entity =>
        {
            entity.HasKey(e => e.CurrId).HasName("PRIMARY");

            entity.ToTable("currency");

            entity.Property(e => e.CurrId)
                .ValueGeneratedNever()
                .HasColumnName("curr_id");
            entity.Property(e => e.CurrName)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("curr_name");
            entity.Property(e => e.CurrSymbol)
                .HasMaxLength(5)
                .IsFixedLength()
                .HasColumnName("curr_symbol");
        });

        modelBuilder.Entity<Destination>(entity =>
        {
            entity.HasKey(e => e.DestId).HasName("PRIMARY");

            entity.ToTable("destination");

            entity.HasIndex(e => e.CurrId, "curr_id");

            entity.HasIndex(e => e.DestRatingId, "dest_rating_id");

            entity.Property(e => e.DestId)
                .ValueGeneratedNever()
                .HasColumnName("dest_id");
            entity.Property(e => e.CurrId).HasColumnName("curr_id");
            entity.Property(e => e.DestCountry)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("dest_country");
            entity.Property(e => e.DestName)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("dest_name");
            entity.Property(e => e.DestRatingId).HasColumnName("dest_rating_id");

            

            
        });

        modelBuilder.Entity<DestinationRating>(entity =>
        {
            entity.HasKey(e => e.DestRatingId).HasName("PRIMARY");

            entity.ToTable("destination_rating");

            entity.Property(e => e.DestRatingId)
                .ValueGeneratedNever()
                .HasColumnName("dest_rating_id");
            entity.Property(e => e.DestRatingName)
                .HasMaxLength(100)
                .HasColumnName("dest_rating_name");
        });

        modelBuilder.Entity<Error>(entity =>
        {
            entity.HasKey(e => e.ErrId).HasName("PRIMARY");

            entity.ToTable("error");

            entity.HasIndex(e => e.AdminId, "admin_id");

            entity.HasIndex(e => e.ErrTypeId, "err_type_id");

            entity.HasIndex(e => e.UserId, "user_id");

            entity.Property(e => e.ErrId)
                .ValueGeneratedNever()
                .HasColumnName("err_id");
            entity.Property(e => e.AdminId).HasColumnName("admin_id");
            entity.Property(e => e.DeviceErrOccured)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("device_err_occured");
            entity.Property(e => e.ErrDateOccured)
                .HasColumnType("datetime")
                .HasColumnName("err_date_occured");
            entity.Property(e => e.ErrResolved)
                .HasColumnType("bit(1)")
                .HasColumnName("err_resolved");
            entity.Property(e => e.ErrTypeId).HasColumnName("err_type_id");
            entity.Property(e => e.UserId).HasColumnName("user_id");

            

            

            
        });

        modelBuilder.Entity<ErrorType>(entity =>
        {
            entity.HasKey(e => e.ErrTypeId).HasName("PRIMARY");

            entity.ToTable("error_type");

            entity.Property(e => e.ErrTypeId)
                .ValueGeneratedNever()
                .HasColumnName("err_type_id");
            entity.Property(e => e.ErrTypeLevel).HasColumnName("err_type_level");
            entity.Property(e => e.ErrTypeName)
                .HasMaxLength(50)
                .IsFixedLength()
                .HasColumnName("err_type_name");
        });

        modelBuilder.Entity<FoodPlace>(entity =>
        {
            entity.HasKey(e => e.FoodpId).HasName("PRIMARY");

            entity.ToTable("food_place");

            entity.HasIndex(e => e.DestId, "dest_id");

            entity.HasIndex(e => e.FoodpTypeId, "foodp_type_id");

            entity.Property(e => e.FoodpId)
                .ValueGeneratedNever()
                .HasColumnName("foodp_id");
            entity.Property(e => e.DestId).HasColumnName("dest_id");
            entity.Property(e => e.FoodpAddress)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("foodp_address");
            entity.Property(e => e.FoodpMaxPrice).HasColumnName("foodp_max_price");
            entity.Property(e => e.FoodpMenuItems)
                .HasColumnType("text")
                .HasColumnName("foodp_menu_items");
            entity.Property(e => e.FoodpMinPrice).HasColumnName("foodp_min_price");
            entity.Property(e => e.FoodpName)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("foodp_name");
            entity.Property(e => e.FoodpRating).HasColumnName("foodp_rating");
            entity.Property(e => e.FoodpTypeId).HasColumnName("foodp_type_id");

            

            
        });

        modelBuilder.Entity<FoodPlaceType>(entity =>
        {
            entity.HasKey(e => e.FoodpTypeId).HasName("PRIMARY");

            entity.ToTable("food_place_type");

            entity.Property(e => e.FoodpTypeId)
                .ValueGeneratedNever()
                .HasColumnName("foodp_type_id");
            entity.Property(e => e.FoodpTypeName)
                .HasMaxLength(50)
                .IsFixedLength()
                .HasColumnName("foodp_type_name");
        });

        modelBuilder.Entity<Notification>(entity =>
        {
            entity.HasKey(e => e.NotiId).HasName("PRIMARY");

            entity.ToTable("notification");

            entity.HasIndex(e => new { e.VacId, e.UserId }, "vac_id");

            entity.Property(e => e.NotiId)
                .ValueGeneratedNever()
                .HasColumnName("noti_id");
            entity.Property(e => e.NotiCreatedDate)
                .HasColumnType("datetime")
                .HasColumnName("noti_created_date");
            entity.Property(e => e.NotiIsRead)
                .HasColumnType("bit(1)")
                .HasColumnName("noti_is_read");
            entity.Property(e => e.NotiMessage)
                .HasColumnType("text")
                .HasColumnName("noti_message");
            entity.Property(e => e.NotiTitle)
                .HasColumnType("text")
                .HasColumnName("noti_title");
            entity.Property(e => e.UserId).HasColumnName("user_id");
            entity.Property(e => e.VacId).HasColumnName("vac_id");

            
        });

        modelBuilder.Entity<SelectedAccomodation>(entity =>
        {
            entity.HasKey(e => new { e.AccId, e.VacId })
                .HasName("PRIMARY")
                .HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0 });

            entity.ToTable("selected_accomodation");

            entity.HasIndex(e => e.VacId, "vac_id");

            entity.Property(e => e.AccId).HasColumnName("acc_id");
            entity.Property(e => e.VacId).HasColumnName("vac_id");
            entity.Property(e => e.EstimatedAccPrice).HasColumnName("estimated_acc_price");
            entity.Property(e => e.NumOfNightsInAcc).HasColumnName("num_of_nights_in_acc");

            

            
        });

        modelBuilder.Entity<SelectedAttraction>(entity =>
        {
            entity.HasKey(e => new { e.AttrId, e.VacId })
                .HasName("PRIMARY")
                .HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0 });

            entity.ToTable("selected_attraction");

            entity.HasIndex(e => e.VacId, "vac_id");

            entity.Property(e => e.AttrId).HasColumnName("attr_id");
            entity.Property(e => e.VacId).HasColumnName("vac_id");
            entity.Property(e => e.EstimatedActivityPrice).HasColumnName("estimated_activity_price");

            

            
        });

        modelBuilder.Entity<SelectedFoodPlace>(entity =>
        {
            entity.HasKey(e => new { e.FoodpId, e.VacId })
                .HasName("PRIMARY")
                .HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0 });

            entity.ToTable("selected_food_place");

            entity.HasIndex(e => e.VacId, "vac_id");

            entity.Property(e => e.FoodpId).HasColumnName("foodp_id");
            entity.Property(e => e.VacId).HasColumnName("vac_id");
            entity.Property(e => e.EstimatedFoodPrice).HasColumnName("estimated_food_price");
            entity.Property(e => e.NumMealsADay).HasColumnName("num_meals_a_day");

            

            
        });

        modelBuilder.Entity<SelectedTransportation>(entity =>
        {
            entity.HasKey(e => new { e.TranspId, e.VacId })
                .HasName("PRIMARY")
                .HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0 });

            entity.ToTable("selected_transportation");

            entity.HasIndex(e => e.VacId, "vac_id");

            entity.Property(e => e.TranspId).HasColumnName("transp_id");
            entity.Property(e => e.VacId).HasColumnName("vac_id");
            entity.Property(e => e.EstimatedTranspPrice).HasColumnName("estimated_transp_price");

            

            
        });

        modelBuilder.Entity<SpenderType>(entity =>
        {
            entity.HasKey(e => e.SpenderTypeId).HasName("PRIMARY");

            entity.ToTable("spender_type");

            entity.Property(e => e.SpenderTypeId)
                .ValueGeneratedNever()
                .HasColumnName("spender_type_id");
            entity.Property(e => e.SpenderTypeLevel).HasColumnName("spender_type_level");
            entity.Property(e => e.SpenderTypeName)
                .HasMaxLength(50)
                .IsFixedLength()
                .HasColumnName("spender_type_name");
        });

        modelBuilder.Entity<Suggestion>(entity =>
        {
            entity.HasKey(e => e.SuggId).HasName("PRIMARY");

            entity.ToTable("suggestion");

            entity.HasIndex(e => e.AdminId, "admin_id");

            entity.HasIndex(e => e.UserId, "user_id");

            entity.Property(e => e.SuggId)
                .ValueGeneratedNever()
                .HasColumnName("sugg_id");
            entity.Property(e => e.AdminId).HasColumnName("admin_id");
            entity.Property(e => e.SuggAdded)
                .HasColumnType("bit(1)")
                .HasColumnName("sugg_added");
            entity.Property(e => e.SuggDateRecorded)
                .HasColumnType("datetime")
                .HasColumnName("sugg_date_recorded");
            entity.Property(e => e.SuggDetails)
                .HasColumnType("text")
                .HasColumnName("sugg_details");
            entity.Property(e => e.UserId).HasColumnName("user_id");

            

            
        });

        modelBuilder.Entity<Transportation>(entity =>
        {
            entity.HasKey(e => e.TranspId).HasName("PRIMARY");

            entity.ToTable("transportation");

            entity.HasIndex(e => e.DestId, "dest_id");

            entity.HasIndex(e => e.TranspTypeId, "transp_type_id");

            entity.Property(e => e.TranspId)
                .ValueGeneratedNever()
                .HasColumnName("transp_id");
            entity.Property(e => e.DestId).HasColumnName("dest_id");
            entity.Property(e => e.TranspMaxPrice).HasColumnName("transp_max_price");
            entity.Property(e => e.TranspMinPrice).HasColumnName("transp_min_price");
            entity.Property(e => e.TranspName)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("transp_name");
            entity.Property(e => e.TranspTypeId).HasColumnName("transp_type_id");

            

            
        });

        modelBuilder.Entity<TransportationType>(entity =>
        {
            entity.HasKey(e => e.TranspTypeId).HasName("PRIMARY");

            entity.ToTable("transportation_type");

            entity.Property(e => e.TranspTypeId)
                .ValueGeneratedNever()
                .HasColumnName("transp_type_id");
            entity.Property(e => e.TranspTypeName)
                .HasMaxLength(50)
                .IsFixedLength()
                .HasColumnName("transp_type_name");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PRIMARY");

            entity.ToTable("user");

            entity.HasIndex(e => e.CurrId, "curr_id");

            entity.Property(e => e.UserId)
                .ValueGeneratedNever()
                .HasColumnName("user_id");
            entity.Property(e => e.CurrId).HasColumnName("curr_id");
            entity.Property(e => e.NotificationOn)
                .HasColumnType("bit(1)")
                .HasColumnName("notification_on");
            entity.Property(e => e.UserBio)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("user_bio");
            entity.Property(e => e.UserCreatedDate)
                .HasColumnType("datetime")
                .HasColumnName("user_created_date");
            entity.Property(e => e.UserEmail)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("user_email");
            entity.Property(e => e.UserName)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("user_name");
            entity.Property(e => e.UserPassword)
                .HasColumnType("text")
                .HasColumnName("user_password");
            entity.Property(e => e.UserSurname)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("user_surname");

            
        });

        modelBuilder.Entity<Vacation>(entity =>
        {
            entity.HasKey(e => e.VacId).HasName("PRIMARY");

            entity.ToTable("vacation");

            entity.Property(e => e.VacId)
                .ValueGeneratedNever()
                .HasColumnName("vac_id");
            entity.Property(e => e.VacEndDate)
                .HasColumnType("datetime")
                .HasColumnName("vac_end_date");
            entity.Property(e => e.VacStartDate)
                .HasColumnType("datetime")
                .HasColumnName("vac_start_date");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
