defmodule Tuto.Recursion.PrintDigits do
  # Base case
  def upto(0), do: :ok

  # Tail recursion
  # With tail recursion, the last operation is the recursive call.
  # upto(3) will print 3, 2, 1, 0
  # def upto(n) do
  #   IO.puts(n)
  #   upto(n - 1)
  # end

  # Head recursion
  # With head recursion, the first operation is the recursive call.
  # upto(3) will print 0, 1, 2, 3
  def upto(n) do
    upto(n - 1)
    IO.puts(n)
  end
end
