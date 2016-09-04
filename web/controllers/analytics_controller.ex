defmodule ClimbingLog.AnalyticsController do
  use ClimbingLog.Web, :controller

  alias ClimbingLog.Climb

  def index(conn, _params) do
    grades = Climb
    |> Climb.grouped_by_grade
    |> Repo.all
    render(conn, "index.json", grades: grades)
  end

end
