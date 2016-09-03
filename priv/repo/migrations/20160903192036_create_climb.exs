defmodule ClimbingLog.Repo.Migrations.CreateClimb do
  use Ecto.Migration

  def change do
    create table(:climbs) do
      add :name, :string
      add :grade, :string
      add :type, :string
      add :location, :string
      add :date, :date
      add :notes, :text

      timestamps()
    end

  end
end
