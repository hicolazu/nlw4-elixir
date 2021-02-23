defmodule Rocketpay.NumbersTest do
  use ExUnit.Case

  alias Rocketpay.Numbers

  describe "sum_from_file/1" do
    test "when there is a file with the given name, returns the sum of numbers" do
      {ok, %{result: result}} = Numbers.sum_from_file("numbers")

      assert ok = :ok
    end

    test "when there is no file with the given name, returns an error" do
      {error, %{message: message}} = Numbers.sum_from_file("banana")

      assert error == :error
    end
  end

end
