use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :wordlog_elixer, WordlogElixer.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :wordlog_elixer, WordlogElixer.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "wordlog_elixer_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

#Tone down bcrypt to speed up tests
config :comeonin, :bcrypt_log_rounds, 4
config :comeonin, :pbkdf2_rounds, 1
