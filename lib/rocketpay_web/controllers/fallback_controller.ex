defmodule RocketpayWeb.FallbackController do
  use RocketpayWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(RocketpayWeb.ErrorView)
    |> render("400.json", result: result)
  end

  def call(conn, nil) do
    conn
    |> put_status(:not_found)
    |> put_view(RocketpayWeb.ErrorView)
    |> render("404.json")
  end

end
