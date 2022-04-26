defmodule EnvixoStore.Repo.Migrations.CreateTableCategory do
  use Ecto.Migration

  def change do
    create table(:categories, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :title, :string

      add :product_id, references(:products)

      timestamps()
    end

    create unique_index(:categories, [:product_id])
  end
end
