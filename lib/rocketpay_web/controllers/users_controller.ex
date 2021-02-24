defmodule RocketpayWeb.UsersController do
  use RocketpayWeb, :controller

  alias Rocketpay.User

  action_fallback RocketpayWeb.FallbackController

  def findAll(conn, _params) do
    users = Rocketpay.Repo.all(User)
    |> Enum.map(fn user -> %{id: user.id, name: user.name, age: user.age, email: user.email, nickname: user.nickname} end)

    conn
    |> put_status(:ok)
    |> json(%{users: users})
  end

  def find(conn, %{"nickname" => nickname}) do
    with %User{} = user <- Rocketpay.get_user(nickname) do
      conn
      |> put_status(:ok)
      |> render("get.json", user: user)
    end
  end

  def create(conn, params) do
    with {:ok, %User{} = user} <- Rocketpay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

end
