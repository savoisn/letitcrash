defmodule Letitcrash.Landing do
  @moduledoc """
  The Landing context.
  """

  import Ecto.Query, warn: false
  alias Letitcrash.Repo

  alias Letitcrash.Landing.Mail

  @doc """
  Returns the list of mails.

  ## Examples

      iex> list_mails()
      [%Mail{}, ...]

  """
  def list_mails do
    Repo.all(Mail)
  end

  @doc """
  Gets a single mail.

  Raises `Ecto.NoResultsError` if the Mail does not exist.

  ## Examples

      iex> get_mail!(123)
      %Mail{}

      iex> get_mail!(456)
      ** (Ecto.NoResultsError)

  """
  def get_mail!(id), do: Repo.get!(Mail, id)

  @doc """
  Creates a mail.

  ## Examples

      iex> create_mail(%{field: value})
      {:ok, %Mail{}}

      iex> create_mail(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_mail(attrs \\ %{}) do
    %Mail{}
    |> Mail.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a mail.

  ## Examples

      iex> update_mail(mail, %{field: new_value})
      {:ok, %Mail{}}

      iex> update_mail(mail, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_mail(%Mail{} = mail, attrs) do
    mail
    |> Mail.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Mail.

  ## Examples

      iex> delete_mail(mail)
      {:ok, %Mail{}}

      iex> delete_mail(mail)
      {:error, %Ecto.Changeset{}}

  """
  def delete_mail(%Mail{} = mail) do
    Repo.delete(mail)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking mail changes.

  ## Examples

      iex> change_mail(mail)
      %Ecto.Changeset{source: %Mail{}}

  """
  def change_mail(%Mail{} = mail) do
    Mail.changeset(mail, %{})
  end
end
