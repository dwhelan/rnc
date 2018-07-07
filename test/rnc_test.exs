defmodule RncTest do
  use ExUnit.Case

  test_cases = %{
    1 => "I",
    2 => "II",
    3 => "III",
    4 => "IV",
    5 => "V",
    6 => "VI",
    7 => "VII",
    8 => "VIII",
    9 => "IX",
    10 => "X",
    11 => "XI",
    12 => "XII",
    14 => "XIV",
    15 => "XV",
    19 => "XIX",
    20 => "XX",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M",
    3999 => "MMMCMXCIX"
  }
  
  test_cases |> Enum.each(fn {arabic, expected_roman} ->
    @arabic arabic
    @expected_roman expected_roman

    test "Rnc.convert(#{@arabic}) => #{@expected_roman}" do
      assert Rnc.convert(@arabic) == @expected_roman
    end
  end)
end
