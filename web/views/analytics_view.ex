defmodule ClimbingLog.AnalyticsView do
  use ClimbingLog.Web, :view

  alias ClimbingLog.Climb

  def render("index.json", %{grades: grades}) do
    %{data: render_many(grades, ClimbingLog.AnalyticsView, "grade.json")}
  end

  def render("grade.json", %{analytics: {grade, type, count}}) do
    %{grade: grade, 
      type: type, 
      count: count}
  end
end
  
