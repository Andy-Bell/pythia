# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pythia,
  ecto_repos: [Pythia.Repo]

config :hound, driver: "phantomjs", app_host: "http://localhost", app_port: 4000

# Configures the endpoint
config :pythia, Pythia.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "H6BOf9MN8Tb4Too8HK4wgbIM9DJmHSSxg5rIZwRH/1PZfFPglTLTLr8NjhuPDRxN",
  render_errors: [view: Pythia.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Pythia.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
