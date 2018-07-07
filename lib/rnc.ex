defmodule Rnc do
  @roman_numerals %{
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
  
  @arabic_keys @roman_numerals |> Map.keys() |> Enum.reverse()

  def convert(arabic), do: @arabic_keys |> Enum.reduce({arabic, ""}, &apply_key(&1, &2)) |> elem(1)

  defp apply_key(key, {arabic, roman}) when arabic >= key, do: apply_key(key, {arabic - key, roman <> @roman_numerals[key]})

  defp apply_key(_key, {arabic, roman}), do: {arabic, roman}
end
