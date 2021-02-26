defmodule RocketpayWeb.AccountsController do
  use RocketpayWeb, :controller

  alias Rocketpay.Account
  alias Rocketpay.Accounts.Transactions.Response, as: TransactionResponse

  action_fallback RocketpayWeb.FallbackController

  def findAll(conn, _params) do
    accounts = Rocketpay.Repo.all(Account)
    |> Enum.map(fn account -> %{id: account.id, balance: account.balance} end)

    conn
    |> put_status(:ok)
    |> json(%{accounts: accounts})
  end

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Rocketpay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- Rocketpay.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    task = Task.async(fn -> Rocketpay.transaction(params) end)

    with {:ok, %TransactionResponse{} = transaction} <- Task.await(task) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end

    # Task.start(fn -> Rocketpay.transaction(params) end)

    # conn
    # |> put_status(:no_content)
    # |> text("")
  end

end
