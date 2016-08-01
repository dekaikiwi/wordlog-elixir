defmodule WordlogElixer.Repo.Migrations.UpdateWord do
  use Ecto.Migration

  def change do
    alter table(:words) do
      timestamps
    end
  end
end
