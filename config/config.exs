# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :wapi,
  ecto_repos: [Wapi.Repo]

# Configures the endpoint
config :wapi, WapiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5AP7DbYUoiYREuEC1uVwciCUAXStD4/5QUd0D3GKQG/0vRnEudaFpudDoh8rl/uo",
  render_errors: [view: WapiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Wapi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :wapi, Wapi.UserManager.Guardian,
  issuer: "wapi",
  # put the result of the mix command above here
  secret_key: "yfncc3vV1rSDCzM7FB9KVE5kzujVQLsLh04SLvmtY1ATxbrhF1owvJgQlkUQbgVx"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
