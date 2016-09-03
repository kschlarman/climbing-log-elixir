defmodule ClimbingLog.Router do
  use ClimbingLog.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ClimbingLog do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", ClimbingLog do
    pipe_through :api
    resources "/climbs", ClimbController, except: [:new, :edit]
  end
end
