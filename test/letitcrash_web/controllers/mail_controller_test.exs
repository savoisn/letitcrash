defmodule LetitcrashWeb.MailControllerTest do
  use LetitcrashWeb.ConnCase

  alias Letitcrash.Landing

  @create_attrs %{address: "some address"}
  @update_attrs %{address: "some updated address"}
  @invalid_attrs %{address: nil}

  def fixture(:mail) do
    {:ok, mail} = Landing.create_mail(@create_attrs)
    mail
  end

  describe "index" do
    test "lists all mails", %{conn: conn} do
      conn = get(conn, Routes.mail_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Mails"
    end
  end

  describe "new mail" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.mail_path(conn, :new))
      assert html_response(conn, 200) =~ "New Mail"
    end
  end

  describe "create mail" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.mail_path(conn, :create), mail: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.mail_path(conn, :show, id)

      conn = get(conn, Routes.mail_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Mail"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.mail_path(conn, :create), mail: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Mail"
    end
  end

  describe "edit mail" do
    setup [:create_mail]

    test "renders form for editing chosen mail", %{conn: conn, mail: mail} do
      conn = get(conn, Routes.mail_path(conn, :edit, mail))
      assert html_response(conn, 200) =~ "Edit Mail"
    end
  end

  describe "update mail" do
    setup [:create_mail]

    test "redirects when data is valid", %{conn: conn, mail: mail} do
      conn = put(conn, Routes.mail_path(conn, :update, mail), mail: @update_attrs)
      assert redirected_to(conn) == Routes.mail_path(conn, :show, mail)

      conn = get(conn, Routes.mail_path(conn, :show, mail))
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, mail: mail} do
      conn = put(conn, Routes.mail_path(conn, :update, mail), mail: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Mail"
    end
  end

  describe "delete mail" do
    setup [:create_mail]

    test "deletes chosen mail", %{conn: conn, mail: mail} do
      conn = delete(conn, Routes.mail_path(conn, :delete, mail))
      assert redirected_to(conn) == Routes.mail_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.mail_path(conn, :show, mail))
      end
    end
  end

  defp create_mail(_) do
    mail = fixture(:mail)
    {:ok, mail: mail}
  end
end
