﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using TAlaApi.Models;

namespace TAlaApi.Migrations
{
    [DbContext(typeof(dataContext))]
    [Migration("20200914181202_final1")]
    partial class final1
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "3.0.0")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("TAlaApi.Models.Charity", b =>
                {
                    b.Property<int>("CharityID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Discreption")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Email")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Password")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("CharityID");

                    b.ToTable("Charity");
                });

            modelBuilder.Entity("TAlaApi.Models.Donation", b =>
                {
                    b.Property<int>("DonationID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<bool>("Adaptation")
                        .HasColumnType("bit");

                    b.Property<string>("Discreption")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Location")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Phone")
                        .HasColumnType("nvarchar(max)");

                    b.Property<bool>("PickUp")
                        .HasColumnType("bit");

                    b.Property<byte[]>("photo")
                        .HasColumnType("varbinary(max)");

                    b.HasKey("DonationID");

                    b.ToTable("Donation");
                });

            modelBuilder.Entity("TAlaApi.Models.Event", b =>
                {
                    b.Property<int>("EventID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Discreption")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("moneyRange")
                        .HasColumnType("int");

                    b.Property<int?>("ownerCharityID")
                        .HasColumnType("int");

                    b.Property<int>("underProcess")
                        .HasColumnType("int");

                    b.HasKey("EventID");

                    b.HasIndex("ownerCharityID");

                    b.ToTable("Event");
                });

            modelBuilder.Entity("TAlaApi.Models.Request", b =>
                {
                    b.Property<int>("RequestID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<bool>("Adaptation")
                        .HasColumnType("bit");

                    b.Property<int?>("CharityID")
                        .HasColumnType("int");

                    b.Property<string>("Discreption")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Location")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Phone")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Type")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("moneyRange")
                        .HasColumnType("int");

                    b.Property<int>("underProcess")
                        .HasColumnType("int");

                    b.HasKey("RequestID");

                    b.HasIndex("CharityID");

                    b.ToTable("Request");
                });

            modelBuilder.Entity("TAlaApi.Models.User", b =>
                {
                    b.Property<int>("UserID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("Age")
                        .HasColumnType("int");

                    b.Property<string>("Email")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("NickName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Password")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("UserID");

                    b.ToTable("User");
                });

            modelBuilder.Entity("TAlaApi.Models.Event", b =>
                {
                    b.HasOne("TAlaApi.Models.Charity", "owner")
                        .WithMany("Events")
                        .HasForeignKey("ownerCharityID");
                });

            modelBuilder.Entity("TAlaApi.Models.Request", b =>
                {
                    b.HasOne("TAlaApi.Models.Charity", null)
                        .WithMany("CharityDonations")
                        .HasForeignKey("CharityID");
                });
#pragma warning restore 612, 618
        }
    }
}
