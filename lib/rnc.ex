defmodule Rnc do
  @roman_numbers %{
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M"
  }
  @keys @roman_numbers |> Map.keys() |> Enum.reverse()

  def convert(arabic), do: @keys |> Enum.reduce({arabic, ""}, &apply_key(&1, &2)) |> elem(1)

  defp apply_key(key, {value, result}) when value >= key, do: apply_key(key, {value - key, result <> @roman_numbers[key]})

  defp apply_key(key, acc), do: acc
end
