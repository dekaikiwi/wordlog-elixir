defmodule WordlogElixer.Repo.Migrations.UpdateTranslation do
  use Ecto.Migration

  def change do
    alter table(:translations) do
      add :locale, :string
    end
    rename table(:translations), :translation, to: :translationString 
  end
end
