defmodule LetitcrashWeb.Router do
  use LetitcrashWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LetitcrashWeb do
    pipe_through :browser

    get "/", PageController, :index
    post "/register_mail", PageController, :register_mail
    resources "/mails", MailController
  end

  # Other scopes may use custom stacks.
  # scope "/api", LetitcrashWeb do
  #   pipe_through :api
  # end
end
