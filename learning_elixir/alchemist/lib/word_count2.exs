filename = IO.gets("Filename: ") |> String.trim

parts = String.split(filename, " -")
file = Enum.at(parts, 0) |> String.trim
flags = case Enum.at(parts, 1) do
  nil -> ["w"]
  chars -> String.split(chars, "") |> Enum.filter(fn x -> x != "" end)
end

body = File.read!(file)

words =
  body
  |> String.split(~r{(\\n|[^\w'])+})
  |> Enum.filter(fn x -> x != "" end)
  |> Enum.count

lines = String.split(body, ~r{\n|\.|\?|\!}) |> Enum.count

chars = String.replace(body, "\n", " ") |> String.length

Enum.each(flags, fn flag ->
  case flag do
    "w" -> IO.puts("Word count: #{words}")
    "l" -> IO.puts("Line count: #{lines}")
    "c" -> IO.puts("Character count: #{chars}")
    _ -> nil
  end
end)
