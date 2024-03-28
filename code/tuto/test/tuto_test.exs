defmodule TutoTest do
  use ExUnit.Case
  doctest Tuto

  test "greets the world" do
    assert Tuto.hello() == :world
  end
end
