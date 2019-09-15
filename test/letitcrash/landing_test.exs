defmodule Letitcrash.LandingTest do
  use Letitcrash.DataCase

  alias Letitcrash.Landing

  describe "mails" do
    alias Letitcrash.Landing.Mail

    @valid_attrs %{address: "some address"}
    @update_attrs %{address: "some updated address"}
    @invalid_attrs %{address: nil}

    def mail_fixture(attrs \\ %{}) do
      {:ok, mail} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Landing.create_mail()

      mail
    end

    test "list_mails/0 returns all mails" do
      mail = mail_fixture()
      assert Landing.list_mails() == [mail]
    end

    test "get_mail!/1 returns the mail with given id" do
      mail = mail_fixture()
      assert Landing.get_mail!(mail.id) == mail
    end

    test "create_mail/1 with valid data creates a mail" do
      assert {:ok, %Mail{} = mail} = Landing.create_mail(@valid_attrs)
      assert mail.address == "some address"
    end

    test "create_mail/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Landing.create_mail(@invalid_attrs)
    end

    test "update_mail/2 with valid data updates the mail" do
      mail = mail_fixture()
      assert {:ok, %Mail{} = mail} = Landing.update_mail(mail, @update_attrs)
      assert mail.address == "some updated address"
    end

    test "update_mail/2 with invalid data returns error changeset" do
      mail = mail_fixture()
      assert {:error, %Ecto.Changeset{}} = Landing.update_mail(mail, @invalid_attrs)
      assert mail == Landing.get_mail!(mail.id)
    end

    test "delete_mail/1 deletes the mail" do
      mail = mail_fixture()
      assert {:ok, %Mail{}} = Landing.delete_mail(mail)
      assert_raise Ecto.NoResultsError, fn -> Landing.get_mail!(mail.id) end
    end

    test "change_mail/1 returns a mail changeset" do
      mail = mail_fixture()
      assert %Ecto.Changeset{} = Landing.change_mail(mail)
    end
  end
end
