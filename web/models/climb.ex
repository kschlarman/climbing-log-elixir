defmodule ClimbingLog.Climb do
  use ClimbingLog.Web, :model

  schema "climbs" do
    field :name, :string
    field :grade, :string
    field :type, :string
    field :location, :string
    field :date, Ecto.Date
    field :notes, :string

    timestamps()
  end

  def sorted_by_date(query) do
    from climb in query,
    order_by: [desc: climb.date]
  end

  def grouped_by_date(climbs) do
    climbs
    |> Enum.group_by(fn (%{date: date}) -> date end)
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :grade, :type, :location, :date, :notes])
    |> validate_required([:name, :grade, :type, :location, :date, :notes])
  end
end
