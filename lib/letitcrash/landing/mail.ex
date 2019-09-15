defmodule Letitcrash.Landing.Mail do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mails" do
    field :address, :string

    timestamps()
  end

  @doc false
  def changeset(mail, attrs) do
    mail
    |> cast(attrs, [:address])
    |> validate_required([:address])
  end
end
