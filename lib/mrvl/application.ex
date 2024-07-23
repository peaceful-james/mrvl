defmodule Mrvl.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MrvlWeb.Telemetry,
      Mrvl.Repo,
      {DNSCluster, query: Application.get_env(:mrvl, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Mrvl.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Mrvl.Finch},
      # Start a worker by calling: Mrvl.Worker.start_link(arg)
      # {Mrvl.Worker, arg},
      # Start to serve requests, typically the last entry
      MrvlWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mrvl.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MrvlWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
