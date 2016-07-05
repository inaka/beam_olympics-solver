use Mix.Config

config :boss, server: :'olympics@Shady-Grove.local'

config :logger, level: :debug

config :logger,
  backends: [:console],
  compile_time_purge_level: :info
