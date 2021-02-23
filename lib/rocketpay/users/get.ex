defmodule Rocketpay.Users.Get do
  alias Rocketpay.{Repo, User}

  def call(nickname) do
    Repo.get_by(User, nickname: nickname)
  end
end
