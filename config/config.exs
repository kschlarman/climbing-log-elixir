# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :climbing_log,
  ecto_repos: [ClimbingLog.Repo]

# Configures the endpoint
config :climbing_log, ClimbingLog.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vhEHlRBxkgC9uHzh+qgM38BXzPToALdqvxhKmEZEAj6Y06Xe3Rs350SCaPT5DWru",
  render_errors: [view: ClimbingLog.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ClimbingLog.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
