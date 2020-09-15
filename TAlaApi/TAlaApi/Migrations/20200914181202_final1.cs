using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace TAlaApi.Migrations
{
    public partial class final1 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Charity",
                columns: table => new
                {
                    CharityID = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Email = table.Column<string>(nullable: true),
                    Password = table.Column<string>(nullable: true),
                    Name = table.Column<string>(nullable: true),
                    Discreption = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Charity", x => x.CharityID);
                });

            migrationBuilder.CreateTable(
                name: "Donation",
                columns: table => new
                {
                    DonationID = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Phone = table.Column<string>(nullable: true),
                    Discreption = table.Column<string>(nullable: true),
                    Location = table.Column<string>(nullable: true),
                    PickUp = table.Column<bool>(nullable: false),
                    photo = table.Column<byte[]>(nullable: true),
                    Adaptation = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Donation", x => x.DonationID);
                });

            migrationBuilder.CreateTable(
                name: "User",
                columns: table => new
                {
                    UserID = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Email = table.Column<string>(nullable: true),
                    Password = table.Column<string>(nullable: true),
                    NickName = table.Column<string>(nullable: true),
                    Age = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_User", x => x.UserID);
                });

            migrationBuilder.CreateTable(
                name: "Event",
                columns: table => new
                {
                    EventID = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Discreption = table.Column<string>(nullable: true),
                    Name = table.Column<string>(nullable: true),
                    ownerCharityID = table.Column<int>(nullable: true),
                    moneyRange = table.Column<int>(nullable: false),
                    underProcess = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Event", x => x.EventID);
                    table.ForeignKey(
                        name: "FK_Event_Charity_ownerCharityID",
                        column: x => x.ownerCharityID,
                        principalTable: "Charity",
                        principalColumn: "CharityID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Request",
                columns: table => new
                {
                    RequestID = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Phone = table.Column<string>(nullable: true),
                    Discreption = table.Column<string>(nullable: true),
                    Location = table.Column<string>(nullable: true),
                    Type = table.Column<string>(nullable: true),
                    Adaptation = table.Column<bool>(nullable: false),
                    moneyRange = table.Column<int>(nullable: false),
                    underProcess = table.Column<int>(nullable: false),
                    CharityID = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Request", x => x.RequestID);
                    table.ForeignKey(
                        name: "FK_Request_Charity_CharityID",
                        column: x => x.CharityID,
                        principalTable: "Charity",
                        principalColumn: "CharityID",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Event_ownerCharityID",
                table: "Event",
                column: "ownerCharityID");

            migrationBuilder.CreateIndex(
                name: "IX_Request_CharityID",
                table: "Request",
                column: "CharityID");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Donation");

            migrationBuilder.DropTable(
                name: "Event");

            migrationBuilder.DropTable(
                name: "Request");

            migrationBuilder.DropTable(
                name: "User");

            migrationBuilder.DropTable(
                name: "Charity");
        }
    }
}
