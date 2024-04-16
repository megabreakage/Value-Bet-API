defmodule V8betApi.Repo do
  use Ecto.Repo,
    otp_app: :v8bet_api,
    adapter: Ecto.Adapters.MyXQL
end
