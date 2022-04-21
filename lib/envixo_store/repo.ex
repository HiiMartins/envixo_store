defmodule EnvixoStore.Repo do
  use Ecto.Repo,
    otp_app: :envixo_store,
    adapter: Ecto.Adapters.Postgres
end
