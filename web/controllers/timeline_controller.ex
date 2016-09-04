defmodule ClimbingLog.TimelineController do
  use ClimbingLog.Web, :controller

  alias ClimbingLog.Climb

  def index(conn, _params) do
    climbs = Climb
    |> Climb.sorted_by_date
    |> Repo.all
    render(conn, "index.json", climbs: climbs)
  end

end
