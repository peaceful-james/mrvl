defmodule Mrvl.Repo do
  use Ecto.Repo,
    otp_app: :mrvl,
    adapter: Ecto.Adapters.Postgres
end
