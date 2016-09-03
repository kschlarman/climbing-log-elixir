defmodule ClimbingLog.ClimbView do
  use ClimbingLog.Web, :view

  def render("index.json", %{climbs: climbs}) do
    %{data: render_many(climbs, ClimbingLog.ClimbView, "climb.json")}
  end

  def render("show.json", %{climb: climb}) do
    %{data: render_one(climb, ClimbingLog.ClimbView, "climb.json")}
  end

  def render("climb.json", %{climb: climb}) do
    %{id: climb.id,
      name: climb.name,
      grade: climb.grade,
      type: climb.type,
      location: climb.location,
      date: climb.date,
      notes: climb.notes}
  end
end
