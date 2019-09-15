defmodule LetitcrashWeb.MailController do
  use LetitcrashWeb, :controller

  alias Letitcrash.Landing
  alias Letitcrash.Landing.Mail

  def index(conn, _params) do
    mails = Landing.list_mails()
    render(conn, "index.html", mails: mails)
  end

  def new(conn, _params) do
    changeset = Landing.change_mail(%Mail{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"mail" => mail_params}) do
    case Landing.create_mail(mail_params) do
      {:ok, mail} ->
        conn
        |> put_flash(:info, "Mail created successfully.")
        |> redirect(to: Routes.mail_path(conn, :show, mail))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    mail = Landing.get_mail!(id)
    render(conn, "show.html", mail: mail)
  end

  def edit(conn, %{"id" => id}) do
    mail = Landing.get_mail!(id)
    changeset = Landing.change_mail(mail)
    render(conn, "edit.html", mail: mail, changeset: changeset)
  end

  def update(conn, %{"id" => id, "mail" => mail_params}) do
    mail = Landing.get_mail!(id)

    case Landing.update_mail(mail, mail_params) do
      {:ok, mail} ->
        conn
        |> put_flash(:info, "Mail updated successfully.")
        |> redirect(to: Routes.mail_path(conn, :show, mail))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", mail: mail, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    mail = Landing.get_mail!(id)
    {:ok, _mail} = Landing.delete_mail(mail)

    conn
    |> put_flash(:info, "Mail deleted successfully.")
    |> redirect(to: Routes.mail_path(conn, :index))
  end
end
