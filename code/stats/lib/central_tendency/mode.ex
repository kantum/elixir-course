defmodule Stats.CentralTendency.Mode do
  alias Stats.{Errors, Validators}
  require Integer

  def mode(nums) when is_list(nums) do
    nums
    |> Validators.validate_num_list()
    |> calc_mode()
  end

  def mode(_), do: Errors.invalid_data_type()

  defp calc_mode({:error, _}), do: Errors.invalid_data_type()
  defp calc_mode({false, _}), do: Errors.invalid_data_type()

  defp calc_mode({true, nums}) do
    ranked_map = Enum.frequencies(nums)

    ranked_map
    |> Map.values()
    |> Enum.max()
    |> mode_func(ranked_map)
  end

  defp mode_func(max, ranked_map) do
    ranked_map
    |> Map.filter(fn {_key, value} -> value == max end)
    |> Map.keys()
  end
end
