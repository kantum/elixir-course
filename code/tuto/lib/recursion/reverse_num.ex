defmodule Tuto.Recursion.ReverseNum do
  def of(0) do
    IO.puts("")
  end

  def of(n) do
    IO.write(rem(n, 10))
    of(div(n, 10))
  end
end
