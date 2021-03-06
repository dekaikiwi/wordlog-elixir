# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :wordlog_elixer,
  ecto_repos: [WordlogElixer.Repo]

# Configures the endpoint
config :wordlog_elixer, WordlogElixer.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Sxj4rfnVceDCXIuOCfiBgklQb+/xrWLrj/rT0JfvXPge1SdbMQAnx3UlDmo1XOhe",
  render_errors: [view: WordlogElixer.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WordlogElixer.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :rollbax,
  access_token: "79593c90cf84428b9752fdbb730ad3f2",
  environment: "staging"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
