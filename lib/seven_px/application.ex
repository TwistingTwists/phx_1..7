defmodule SevenPx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SevenPxWeb.Telemetry,
      # Start the Ecto repository
      SevenPx.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: SevenPx.PubSub},
      # Start Finch
      {Finch, name: SevenPx.Finch},
      # Start the Endpoint (http/https)
      SevenPxWeb.Endpoint
      # Start a worker by calling: SevenPx.Worker.start_link(arg)
      # {SevenPx.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SevenPx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SevenPxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
