defmodule WapiWeb.Router do
  use WapiWeb, :router

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

  pipeline :auth do
    plug Wapi.UserManager.Pipeline
  end

  # We use ensure_auth to fail if there is no one logged in
  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  # Maybe logged in routes
  scope "/", WapiWeb do
    pipe_through [:browser, :auth]

    get "/", PageController, :index
    get "/login", SessionController, :new
    post "/login", SessionController, :login
    post "/logout", SessionController, :logout
  end

  # Definitely logged in scope
  scope "/", WapiWeb do
    pipe_through [:browser, :auth, :ensure_auth]

    get "/secret", PageController, :secret
  end

  # Other scopes may use custom stacks.
  # scope "/api", WapiWeb do
  #   pipe_through :api
  # end
end
