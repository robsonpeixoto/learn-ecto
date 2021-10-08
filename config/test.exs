use Mix.Config

config :friends, Friends.Repo,
  database: "friends",
  username: "pguser",
  password: "pgpass",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
