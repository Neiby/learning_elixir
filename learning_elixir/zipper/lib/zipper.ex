defmodule Zipper do
  def dec(x), do: x - 1

  def zipper(a) do
    b = [0 | a]

    List.zip([a, b])
    |> Enum.map(fn {x, y} -> x > y end)
    |> Enum.count(&(&1 == true))
    |> dec()
  end
end
