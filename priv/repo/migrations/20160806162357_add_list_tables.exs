defmodule WordlogElixer.Repo.Migrations.AddListTables do
  use Ecto.Migration

  def change do
    create table(:lists) do
      add :name, :string
      add :description, :string
      add :type, :string

      timestamps
    end

    create table(:lists_words) do
      add :list_id, references(:lists)
      add :word_id, references(:words)

      timestamps
    end
  end
end
