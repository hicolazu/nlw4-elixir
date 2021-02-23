defmodule RocketpayWeb.UsersView do
  alias Rocketpay.User

  def render("create.json", %{user: %User{id: id, name: name, nickname: nickname}}) do
    %{
      message: "User created",
      user: %{
        id: id,
        name: name,
        nickname: nickname
      }
    }
  end

  def render("get.json", %{user: %User{id: id, name: name, email: email, age: age, nickname: nickname}}) do
    %{
      message: "User found",
      user: %{
        id: id,
        name: name,
        nickname: nickname,
        email: email,
        age: age
      }
    }
  end
end
