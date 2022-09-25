defmodule Guesser do
  def guess(a, b) when a > b do
    guess(b, a)
  end

  def guess(low, high) do
    response = IO.gets("Are you thinking of #{mid(low, high)}?  ")

    case initial(response) do
      "y" ->
        IO.puts("Got it!")

      "b" ->
        bigger(low, high)

      "s" ->
        smaller(low, high)

      _ ->
        IO.puts("Valid responses are 'smaller', 'bigger', or 'yes'.\n")
        guess(low, high)
    end
  end

  def initial(s) do
    String.downcase(String.first(String.trim(s)))
  end

  def bigger(low, high) do
    new_low = min(high, mid(low, high))
    guess(new_low, high)
  end

  def smaller(low, high) do
    new_high = max(low, mid(low, high))
    guess(low, new_high)
  end

  def mid(low, high) do
    div(high + low, 2)
  end
end
