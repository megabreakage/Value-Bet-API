defmodule V8betApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      V8betApiWeb.Telemetry,
      V8betApi.Repo,
      {DNSCluster, query: Application.get_env(:v8bet_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: V8betApi.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: V8betApi.Finch},
      # Start a worker by calling: V8betApi.Worker.start_link(arg)
      # {V8betApi.Worker, arg},
      # Start to serve requests, typically the last entry
      V8betApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: V8betApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    V8betApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
