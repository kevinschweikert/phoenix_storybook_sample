import Config

config :phx_live_storybook_sample, PhxLiveStorybookSampleWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    view: PhxLiveStorybookSampleWeb.ErrorView,
    accepts: ~w(html json),
    layout: false
  ],
  pubsub_server: PhxLiveStorybookSample.PubSub,
  live_view: [signing_salt: "fYsrW27v"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js js/components.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :tailwind,
  version: "3.1.6",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phx_live_storybook, :gzip_assets, false

config :phx_live_storybook_sample, Storybook,
  content_path: Path.expand("../storybook/", __DIR__),
  css_path: "/assets/app.css",
  js_path: "/assets/components.js",
  folders: [
    /: [icon: "fal fa-book-open"],
    "/components": [icon: "far fa-toolbox", open: true],
    "/components/live": [icon: "fal fa-bolt", open: true, name: "Live!"]
  ],
  themes: [
    default: [name: "Default"],
    colorful: [name: "Colorful", dropdown_class: "text-pink-600"]
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
