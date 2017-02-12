defmodule WordlogElixer.Router do
  use WordlogElixer.Web, :router

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

  scope "/", WordlogElixer do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/lists", ListController, only: [:index, :show, :new, :create]
  end

  scope "/api", WordlogElixer do
    pipe_through :api

    resources "/lists", Api.ListController, only: [:index, :show, :create] do
      post "/words", Api.ListController, :add_word
    end

    resources "/words", Api.WordController, only: [:index, :show, :create] do
      resources "/translations", Api.TranslationController, only: [:create]
    end

    get "/search/jisho/:word", Api.SearchController, :search_jisho

    resources "/users", Api.UserController, only: [:create]
    resources "/sessions", Api.SessionController, only: [:create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", WordlogElixer do
  #   pipe_through :api
  # end
end
