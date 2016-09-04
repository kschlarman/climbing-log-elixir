defmodule ClimbingLog.OutingView do
  use ClimbingLog.Web, :view

  def render("outing.json", %{outing: {date, climbs}}) do
    with {:ok, location} <- climbs |> List.first |> Map.fetch(:location),
    do: (
      %{info: %{
          date: date,
          location: location
        },
        climbs: render_many(climbs, ClimbingLog.ClimbView, "climb.json")
      }
    )
  end
end
