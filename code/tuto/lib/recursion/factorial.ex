# This module calculates the factorial of a number using recursion and tail recursion.
defmodule Tuto.Recursion.Factorial do
  def of(0), do: 1

  def of(n) do
    of(n - 1) * n
  end

  def of_tail_rec(n, acc \\ 1)
  def of_tail_rec(0, acc), do: acc

  def of_tail_rec(n, acc) do
    of_tail_rec(n - 1, acc * n)
  end
end
