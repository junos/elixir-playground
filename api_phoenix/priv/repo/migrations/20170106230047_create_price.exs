defmodule ApiPhoenix.Repo.Migrations.CreatePrice do
  use Ecto.Migration

  def change do
    create table(:prices) do
      add :field1, :string
      add :field2, :string
      add :field3, :string
      add :field4, :string
      add :field5, :string
      add :field6, :string
      add :field7, :string
      add :field8, :string
      add :field9, :string
      add :field10, :string
      add :field11, :string
      add :field12, :string
      add :field13, :string
      add :field14, :string
      add :field15, :string

      timestamps()
    end

  end
end
