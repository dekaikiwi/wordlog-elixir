defmodule WordlogElixer.Repo.Migrations.UpdateTranslationAddWord do
  use Ecto.Migration

  def change do
    create table(:words) do
      add :word_string, :string
    end

    rename table(:translations), :translationString, to: :translation_string

    alter table(:translations) do
      remove :word
      add :word_id, references(:words)
    end
  end
end
