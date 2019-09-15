defmodule LetitcrashWeb.PageController do

  use LetitcrashWeb, :controller

  alias Letitcrash.Landing
  alias Letitcrash.Landing.Mail

  def index(conn, _params) do
    mails = Landing.list_mails()
    changeset = Landing.change_mail(%Mail{})
    render(conn, "index.html", changeset: changeset)
  end

  def register_mail(conn, %{"mail" => mail_params}) do
    case Landing.create_mail(mail_params) do
      {:ok, mail} ->
        conn
        |> put_flash(:info, "Email stored successfully. You will get news of the event !")
        |> redirect(to: Routes.page_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
