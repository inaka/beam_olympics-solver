use Mix.Config

config :boss, server: :'olympics@127.0.0.1'

config :logger, level: :debug

config :logger,
  backends: [:console],
  compile_time_purge_level: :info
