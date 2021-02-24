defmodule RocketpayWeb.UsersController do
  use RocketpayWeb, :controller

  alias Rocketpay.User

  def findAll(conn, _params) do
    users = Rocketpay.Repo.all(User)
    |> Enum.map(fn user -> %{id: user.id, name: user.name, age: user.age, email: user.email, nickname: user.nickname} end)

    conn
    |> put_status(:ok)
    |> json(%{users: users})
  end

  def find(conn, %{"nickname" => nickname}) do
    nickname
    |> Rocketpay.get_user()
    |> handle_get_response(conn)
  end

  def create(conn, params) do
    params
    |> Rocketpay.create_user()
    |> handle_post_response(conn)
  end

  defp handle_get_response(%User{} = user, conn) do
    conn
    |> put_status(:ok)
    |> render("get.json", user: user)
  end

  defp handle_post_response({:ok, %User{} = user}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", user: user)
  end

  defp handle_post_response({:error, result}, conn) do
    conn
    |> put_status(:bad_request)
    |> put_view(RocketpayWeb.ErrorView)
    |> render("400.json", result: result)
  end

end
