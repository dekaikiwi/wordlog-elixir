defmodule WordlogElixer.Repo.Migrations.CreateTranslation do
  use Ecto.Migration

  def change do
    create table(:translations) do
      add :word, :string
      add :translation, :string

      timestamps
    end
  end
end
