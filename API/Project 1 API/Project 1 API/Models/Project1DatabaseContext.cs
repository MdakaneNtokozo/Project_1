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

    public virtual DbSet<Accommodation> Accommodations { get; set; }

    public virtual DbSet<AccomodationType> AccomodationTypes { get; set; }

    public virtual DbSet<Attraction> Attractions { get; set; }

    public virtual DbSet<Country> Countries { get; set; }

    public virtual DbSet<CreatedPlan> CreatedPlans { get; set; }

    public virtual DbSet<Currency> Currencies { get; set; }

    public virtual DbSet<Destination> Destinations { get; set; }

    public virtual DbSet<ExchangeRate> ExchangeRates { get; set; }

    public virtual DbSet<FoodSpot> FoodSpots { get; set; }

    public virtual DbSet<FoodSpotType> FoodSpotTypes { get; set; }

    public virtual DbSet<SelectedAccommodation> SelectedAccommodations { get; set; }

    public virtual DbSet<SelectedAttraction> SelectedAttractions { get; set; }

    public virtual DbSet<SelectedFoodSpot> SelectedFoodSpots { get; set; }

    public virtual DbSet<SelectedTransportation> SelectedTransportations { get; set; }

    public virtual DbSet<SpenderType> SpenderTypes { get; set; }

    public virtual DbSet<Transportation> Transportations { get; set; }

    public virtual DbSet<TransportationType> TransportationTypes { get; set; }

    public virtual DbSet<TravelBuddy> TravelBuddies { get; set; }

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

        modelBuilder.Entity<Accommodation>(entity =>
        {
            entity.HasKey(e => e.AccommodationId).HasName("PRIMARY");

            entity.ToTable("accommodation");

            entity.HasIndex(e => e.AccomodationTypeId, "accomodation_type_id");

            entity.HasIndex(e => e.DestinationId, "destination_id");

            entity.Property(e => e.AccommodationId)
                .ValueGeneratedNever()
                .HasColumnName("accommodation_id");
            entity.Property(e => e.AccommodationAddress)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("accommodation_address");
            entity.Property(e => e.AccommodationAmenities)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("accommodation_amenities");
            entity.Property(e => e.AccommodationImage)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("accommodation_image");
            entity.Property(e => e.AccommodationMaxNumOfPeople).HasColumnName("accommodation_max_num_of_people");
            entity.Property(e => e.AccommodationMinNumOfPeople).HasColumnName("accommodation_min_num_of_people");
            entity.Property(e => e.AccommodationName)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("accommodation_name");
            entity.Property(e => e.AccommodationPricePerPerson).HasColumnName("accommodation_price_per_person");
            entity.Property(e => e.AccommodationRating).HasColumnName("accommodation_rating");
            entity.Property(e => e.AccommodationTypeId).HasColumnName("accommodation_type_id");
            entity.Property(e => e.AccomodationTypeId).HasColumnName("accomodation_type_id");
            entity.Property(e => e.DestinationId).HasColumnName("destination_id");

            

            
        });

        modelBuilder.Entity<AccomodationType>(entity =>
        {
            entity.HasKey(e => e.AccomodationTypeId).HasName("PRIMARY");

            entity.ToTable("accomodation_type");

            entity.Property(e => e.AccomodationTypeId)
                .ValueGeneratedNever()
                .HasColumnName("accomodation_type_id");
            entity.Property(e => e.AccomodationTypeName)
                .HasMaxLength(50)
                .IsFixedLength()
                .HasColumnName("accomodation_type_name");
        });

        modelBuilder.Entity<Attraction>(entity =>
        {
            entity.HasKey(e => e.AttractionId).HasName("PRIMARY");

            entity.ToTable("attraction");

            entity.HasIndex(e => e.DestinationId, "destination_id");

            entity.Property(e => e.AttractionId)
                .ValueGeneratedNever()
                .HasColumnName("attraction_id");
            entity.Property(e => e.AttractionAddress)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("attraction_address");
            entity.Property(e => e.AttractionDescription)
                .HasColumnType("text")
                .HasColumnName("attraction_description");
            entity.Property(e => e.AttractionEntranceFee).HasColumnName("attraction_entrance_fee");
            entity.Property(e => e.AttractionImage)
                .HasColumnType("text")
                .HasColumnName("attraction_image");
            entity.Property(e => e.AttractionName)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("attraction_name");
            entity.Property(e => e.AttractionPricePerPerson).HasColumnName("attraction_price_per_person");
            entity.Property(e => e.AttractionRating)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("attraction_rating");
            entity.Property(e => e.AttractionTimeLimited).HasColumnName("attraction_time_limited");
            entity.Property(e => e.DestinationId).HasColumnName("destination_id");

            
        });

        modelBuilder.Entity<Country>(entity =>
        {
            entity.HasKey(e => e.CountryId).HasName("PRIMARY");

            entity.ToTable("country");

            entity.HasIndex(e => e.CurrencyId, "currency_id");

            entity.Property(e => e.CountryId)
                .ValueGeneratedNever()
                .HasColumnName("country_id");
            entity.Property(e => e.CountryName)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("country_name");
            entity.Property(e => e.CurrencyId).HasColumnName("currency_id");

            
        });

        modelBuilder.Entity<CreatedPlan>(entity =>
        {
            entity.HasKey(e => new { e.VacationId, e.UserId })
                .HasName("PRIMARY")
                .HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0 });

            entity.ToTable("created_plan");

            entity.HasIndex(e => e.SpenderTypeId, "spender_type_id");

            entity.HasIndex(e => e.UserId, "user_id");

            entity.Property(e => e.VacationId).HasColumnName("vacation_id");
            entity.Property(e => e.UserId).HasColumnName("user_id");
            entity.Property(e => e.PlanBudget).HasColumnName("plan_budget");
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
            entity.HasKey(e => e.CurrencyId).HasName("PRIMARY");

            entity.ToTable("currency");

            entity.Property(e => e.CurrencyId)
                .ValueGeneratedNever()
                .HasColumnName("currency_id");
            entity.Property(e => e.CurrencyName)
                .HasMaxLength(50)
                .IsFixedLength()
                .HasColumnName("currency_name");
            entity.Property(e => e.CurrencySymbol)
                .HasMaxLength(50)
                .IsFixedLength()
                .HasColumnName("currency_symbol");
        });

        modelBuilder.Entity<Destination>(entity =>
        {
            entity.HasKey(e => e.DestinationId).HasName("PRIMARY");

            entity.ToTable("destination");

            entity.HasIndex(e => e.CountryId, "country_id");

            entity.Property(e => e.DestinationId)
                .ValueGeneratedNever()
                .HasColumnName("destination_id");
            entity.Property(e => e.CountryId).HasColumnName("country_id");
            entity.Property(e => e.DestinationCountry)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("destination_country");
            entity.Property(e => e.DestinationDescription)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("destination_description");
            entity.Property(e => e.DestinationImage)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("destination_image");
            entity.Property(e => e.DestinationName)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("destination_name");
            entity.Property(e => e.DestinationRating).HasColumnName("destination_rating");

            
        });

        modelBuilder.Entity<ExchangeRate>(entity =>
        {
            entity.HasKey(e => new { e.CurrentId, e.TargetId })
                .HasName("PRIMARY")
                .HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0 });

            entity.ToTable("exchange_rate");

            entity.HasIndex(e => e.TargetId, "target_id");

            entity.Property(e => e.CurrentId).HasColumnName("current_id");
            entity.Property(e => e.TargetId).HasColumnName("target_id");
            entity.Property(e => e.ExchangeRate1).HasColumnName("exchange_rate");

            

            
        });

        modelBuilder.Entity<FoodSpot>(entity =>
        {
            entity.HasKey(e => e.FoodSpotId).HasName("PRIMARY");

            entity.ToTable("food_spot");

            entity.HasIndex(e => e.DestinationId, "destination_id");

            entity.HasIndex(e => e.FoodSpotTypeId, "food_spot_type_id");

            entity.Property(e => e.FoodSpotId)
                .ValueGeneratedNever()
                .HasColumnName("food_spot_id");
            entity.Property(e => e.DestinationId).HasColumnName("destination_id");
            entity.Property(e => e.FoodSpotAddress)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("food_spot_address");
            entity.Property(e => e.FoodSpotImage)
                .HasColumnType("text")
                .HasColumnName("food_spot_image");
            entity.Property(e => e.FoodSpotMaxMenuPrice).HasColumnName("food_spot_max_menu_price");
            entity.Property(e => e.FoodSpotMenuItems)
                .HasColumnType("text")
                .HasColumnName("food_spot_menu_items");
            entity.Property(e => e.FoodSpotMinMenuPrice).HasColumnName("food_spot_min_menu_price");
            entity.Property(e => e.FoodSpotName)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("food_spot_name");
            entity.Property(e => e.FoodSpotRating).HasColumnName("food_spot_rating");
            entity.Property(e => e.FoodSpotTypeId).HasColumnName("food_spot_type_id");

            

            
        });

        modelBuilder.Entity<FoodSpotType>(entity =>
        {
            entity.HasKey(e => e.FoodSpotTypeId).HasName("PRIMARY");

            entity.ToTable("food_spot_type");

            entity.Property(e => e.FoodSpotTypeId)
                .ValueGeneratedNever()
                .HasColumnName("food_spot_type_id");
            entity.Property(e => e.FoodSpotTypeName)
                .HasMaxLength(50)
                .IsFixedLength()
                .HasColumnName("food_spot_type_name");
        });

        modelBuilder.Entity<SelectedAccommodation>(entity =>
        {
            entity.HasKey(e => new { e.AccommodationId, e.VacationId })
                .HasName("PRIMARY")
                .HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0 });

            entity.ToTable("selected_accommodation");

            entity.HasIndex(e => e.VacationId, "vacation_id");

            entity.Property(e => e.AccommodationId).HasColumnName("accommodation_id");
            entity.Property(e => e.VacationId).HasColumnName("vacation_id");
            entity.Property(e => e.AccommodationBudget).HasColumnName("accommodation_budget");
            entity.Property(e => e.CheckInDate)
                .HasColumnType("datetime")
                .HasColumnName("check_in_date");
            entity.Property(e => e.CheckOutDate)
                .HasColumnType("datetime")
                .HasColumnName("check_out_date");

            

            
        });

        modelBuilder.Entity<SelectedAttraction>(entity =>
        {
            entity.HasKey(e => new { e.AttractionId, e.VacationId })
                .HasName("PRIMARY")
                .HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0 });

            entity.ToTable("selected_attractions");

            entity.HasIndex(e => e.VacationId, "vacation_id");

            entity.Property(e => e.AttractionId).HasColumnName("attraction_id");
            entity.Property(e => e.VacationId).HasColumnName("vacation_id");
            entity.Property(e => e.AttractionBudget).HasColumnName("attraction_budget");
            entity.Property(e => e.NumOfTimes).HasColumnName("Num_of_times");
            entity.Property(e => e.SelectedExperienceType).HasColumnName("selected_experience_type");

            

            
        });

        modelBuilder.Entity<SelectedFoodSpot>(entity =>
        {
            entity.HasKey(e => new { e.FoodSpotId, e.VacationId })
                .HasName("PRIMARY")
                .HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0 });

            entity.ToTable("selected_food_spot");

            entity.HasIndex(e => e.VacationId, "vacation_id");

            entity.Property(e => e.FoodSpotId).HasColumnName("food_spot_id");
            entity.Property(e => e.VacationId).HasColumnName("vacation_id");
            entity.Property(e => e.FoodSpotBudget).HasColumnName("food_spot_budget");
            entity.Property(e => e.NumOfTimes).HasColumnName("Num_of_times");
            entity.Property(e => e.SelectedExperienceType).HasColumnName("selected_experience_type");

            

            
        });

        modelBuilder.Entity<SelectedTransportation>(entity =>
        {
            entity.HasKey(e => new { e.TransportationId, e.VacationId })
                .HasName("PRIMARY")
                .HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0 });

            entity.ToTable("selected_transportation");

            entity.HasIndex(e => e.VacationId, "vacation_id");

            entity.Property(e => e.TransportationId).HasColumnName("transportation_id");
            entity.Property(e => e.VacationId).HasColumnName("vacation_id");
            entity.Property(e => e.NumOfTimes).HasColumnName("Num_of_times");
            entity.Property(e => e.SelectedUseType).HasColumnName("selected_use_type");
            entity.Property(e => e.TransportationBudget).HasColumnName("transportation_budget");

            

            
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

        modelBuilder.Entity<Transportation>(entity =>
        {
            entity.HasKey(e => e.TransportationId).HasName("PRIMARY");

            entity.ToTable("transportation");

            entity.HasIndex(e => e.DestinationId, "destination_id");

            entity.HasIndex(e => e.TransportationTypeId, "transportation_type_id");

            entity.Property(e => e.TransportationId)
                .ValueGeneratedNever()
                .HasColumnName("transportation_id");
            entity.Property(e => e.DestinationId).HasColumnName("destination_id");
            entity.Property(e => e.TransportationImage)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("transportation_image");
            entity.Property(e => e.TransportationMaxPeople).HasColumnName("transportation_max_people");
            entity.Property(e => e.TransportationMinPeople).HasColumnName("transportation_min_people");
            entity.Property(e => e.TransportationName)
                .HasMaxLength(100)
                .IsFixedLength()
                .HasColumnName("transportation_name");
            entity.Property(e => e.TransportationPricePerPerson).HasColumnName("transportation_price_per_person");
            entity.Property(e => e.TransportationRating).HasColumnName("transportation_rating");
            entity.Property(e => e.TransportationTypeId).HasColumnName("transportation_type_id");

            

            
        });

        modelBuilder.Entity<TransportationType>(entity =>
        {
            entity.HasKey(e => e.TransportationTypeId).HasName("PRIMARY");

            entity.ToTable("transportation_type");

            entity.Property(e => e.TransportationTypeId)
                .ValueGeneratedNever()
                .HasColumnName("transportation_type_id");
            entity.Property(e => e.TransportationTypeName)
                .HasMaxLength(50)
                .IsFixedLength()
                .HasColumnName("transportation_type_name");
        });

        modelBuilder.Entity<TravelBuddy>(entity =>
        {
            entity.HasKey(e => new { e.VacationId, e.UserId })
                .HasName("PRIMARY")
                .HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0 });

            entity.ToTable("travel_buddy");

            entity.HasIndex(e => e.UserId, "user_id");

            entity.Property(e => e.VacationId).HasColumnName("vacation_id");
            entity.Property(e => e.UserId).HasColumnName("user_id");
            entity.Property(e => e.ViewedPlan).HasColumnName("viewed_plan");

            

            
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PRIMARY");

            entity.ToTable("user");

            entity.HasIndex(e => e.CurrencyId, "currency_id");

            entity.Property(e => e.UserId)
                .ValueGeneratedNever()
                .HasColumnName("user_id");
            entity.Property(e => e.CurrencyId).HasColumnName("currency_id");
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
            entity.Property(e => e.UserNotificationOn).HasColumnName("user_notification_on");
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
            entity.HasKey(e => e.VacationId).HasName("PRIMARY");

            entity.ToTable("vacation");

            entity.Property(e => e.VacationId)
                .ValueGeneratedNever()
                .HasColumnName("vacation_id");
            entity.Property(e => e.VacationEndDate)
                .HasColumnType("datetime")
                .HasColumnName("vacation_end_date");
            entity.Property(e => e.VacationStartDate)
                .HasColumnType("datetime")
                .HasColumnName("vacation_start_date");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
