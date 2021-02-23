defmodule Rocketpay do
  alias Rocketpay.Users.Create, as: CreateUser
  alias Rocketpay.Users.Get, as: GetUser

  defdelegate create_user(params), to: CreateUser, as: :call
  defdelegate get_user(nickname), to: GetUser, as: :call
end
