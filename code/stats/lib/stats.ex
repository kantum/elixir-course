defmodule Stats do
  alias Stats.CentralTendency.{Mean, Median, Mode}

  # def population_mean(nums), do: Mean.population_mean(nums) # is equivalent
  defdelegate population_mean(nums), to: Mean
  defdelegate sample_mean(nums), to: Mean
  defdelegate median(nums), to: Median
  defdelegate mode(nums), to: Mode
end
