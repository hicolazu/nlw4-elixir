defmodule RocketpayWeb.UsersView do
  alias Rocketpay.{User, Account}

  def render("create.json", %{user: %User{account: %Account{id: account_id, balance: balance}, id: id, name: name, nickname: nickname}}) do
    %{
      message: "User created",
      user: %{
        id: id,
        name: name,
        nickname: nickname,
        account: %{
          id: account_id,
          balance: balance
        }
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
