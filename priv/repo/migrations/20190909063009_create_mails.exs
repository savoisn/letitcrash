defmodule Letitcrash.Repo.Migrations.CreateMails do
  use Ecto.Migration

  def change do
    create table(:mails) do
      add :address, :string

      timestamps()
    end

  end
end
