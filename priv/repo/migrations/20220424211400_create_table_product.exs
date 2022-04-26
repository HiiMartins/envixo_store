defmodule EnvixoStore.Repo.Migrations.CreateTableProduct do
  use Ecto.Migration

  def change do
    create table(:products, primary_key: false) do
       add :id, :uuid, primary_key: true
       add :title, :string
       add :description, :string
       add :status, :boolean
       add :price, :float
       add :promotion_price, :float
    end
  end
end
