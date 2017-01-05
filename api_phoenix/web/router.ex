defmodule ApiPhoenix.Router do
  use ApiPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["xml","json"]
  end

  scope "/", ApiPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", ApiPhoenix do
    pipe_through :api

    resources "/markets", MarketController, except: [:new, :edit] do
      resources "/products", ProductController, only: [:index]
      end

      resources "/products", ProductController, except: [:new, :edit]
  end
end
