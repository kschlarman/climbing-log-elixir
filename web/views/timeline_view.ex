defmodule ClimbingLog.TimelineView do
  use ClimbingLog.Web, :view

  alias ClimbingLog.Climb

  def render("index.json", %{climbs: climbs}) do
    with outings <- climbs |> Climb.grouped_by_date,
    do: %{data: render_many(outings, ClimbingLog.OutingView, "outing.json")}
  end
end
  
