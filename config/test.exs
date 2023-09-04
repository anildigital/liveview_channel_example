import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :liveview_chat_example, LiveviewChatExample.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "liveview_chat_example_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :liveview_chat_example, LiveviewChatExampleWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "XUoTgK4xBHh4UOksumJSXpQ1u+XxgmqtGOId8xr5FXtoNqvjz7ZZGVziJ2A5t7bi",
  server: false

# In test we don't send emails.
config :liveview_chat_example, LiveviewChatExample.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
