defmodule EnvixoStore.Repo.Migrations.AlterTableProducts do
  use Ecto.Migration

  def change do
    alter table("products") do
      add :category_id, references(:categories, type: :uuid)
    end
  end
end
