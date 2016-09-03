defmodule ClimbingLog.PageController do
  use ClimbingLog.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
