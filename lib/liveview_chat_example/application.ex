defmodule LiveviewChatExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LiveviewChatExampleWeb.Telemetry,
      # Start the Ecto repository
      LiveviewChatExample.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiveviewChatExample.PubSub},
      # Start Finch
      {Finch, name: LiveviewChatExample.Finch},
      # Start the Endpoint (http/https)
      LiveviewChatExampleWeb.Endpoint
      # Start a worker by calling: LiveviewChatExample.Worker.start_link(arg)
      # {LiveviewChatExample.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveviewChatExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveviewChatExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
