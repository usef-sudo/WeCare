using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace TAlaApi.Migrations
{
    public partial class a : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Adaptation",
                table: "Request");

            migrationBuilder.AddColumn<bool>(
                name: "Adoptation",
                table: "Request",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<byte[]>(
                name: "img",
                table: "Charity",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Adoptation",
                table: "Request");

            migrationBuilder.DropColumn(
                name: "img",
                table: "Charity");

            migrationBuilder.AddColumn<bool>(
                name: "Adaptation",
                table: "Request",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }
    }
}
