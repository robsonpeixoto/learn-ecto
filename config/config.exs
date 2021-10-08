import Config

config :friends, Friends.Repo,
  database: "friends",
  username: "pguser",
  password: "pgpass",
  hostname: "localhost"

config :friends, ecto_repos: [Friends.Repo]

import_config "#{Mix.env()}.exs"
