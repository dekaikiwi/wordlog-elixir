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
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    resources "/users", UserController, only: [:index, :show] do
      resources "/posts", PostController, only: [:index, :show]
    end  # Tutorial
  end

  scope "/api", WordlogElixer do
    pipe_through :api

    resources "/lists", ListController, only: [:index, :show, :create] do
      post "/words", ListController, :add_word
    end

    resources "/words", WordController, only: [:index, :show, :create] do
      resources "/translations", TranslationController, only: [:create]
    end

    get "/search/jisho/:word", SearchController, :search_jisho
  end

  # Other scopes may use custom stacks.
  # scope "/api", WordlogElixer do
  #   pipe_through :api
  # end
end
