defmodule WordlogElixer.Repo.Migrations.MoveLocaleToWord do
  use Ecto.Migration

  def change do
    alter table(:words) do
      add :locale, :string
    end

    alter table(:translations) do
      remove :locale
    end
  end
end
