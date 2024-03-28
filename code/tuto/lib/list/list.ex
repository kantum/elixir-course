defmodule Tuto.List do
  @moduledoc """

  Function Summary:
  1. sum/1: This function is a wrapper function that calls sum_tail/1.
  """

  @doc """
  Returns the sum of a list of numbers.

  """
  @spec sum(list(number)) :: number
  def sum(numbers) do
    sum_tail(numbers)
  end

  @spec sum_simple(list(number)) :: number
  def sum_simple([]), do: 0

  def sum_simple([h | t]), do: h + sum_simple(t)

  @spec sum_tail(list(number), number) :: number
  def sum_tail(numbers, acc \\ 0)
  def sum_tail([], acc), do: acc
  def sum_tail([h | t], acc), do: sum_tail(t, acc + h)

  @spec reverse([any()], [any()]) :: [any()]
  def reverse(elements, acc \\ [])
  def reverse([], acc), do: acc
  def reverse([h | t], acc), do: reverse(t, [h | acc])
end
