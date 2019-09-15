defmodule Letitcrash.Repo do
  use Ecto.Repo,
    otp_app: :letitcrash,
    adapter: Ecto.Adapters.Postgres
end
