defmodule Tuto.Recursion.SumDigits do
  # Also works without the accumulator
  # def upto(0), do:
  #
  # def upto(n) do
  #   # n + upto(n - 1)
  #   upto_tail_rec(n)
  # end

  def upto(n, acc \\ 0)

  def upto(0, acc), do: acc

  def upto(n, acc) do
    upto(n - 1, acc + n)
  end
end
