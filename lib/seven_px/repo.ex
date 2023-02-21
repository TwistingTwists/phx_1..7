defmodule SevenPx.Repo do
  use Ecto.Repo,
    otp_app: :seven_px,
    adapter: Ecto.Adapters.Postgres
end
