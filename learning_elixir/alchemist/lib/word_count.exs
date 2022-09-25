IO.gets("Filename:  ")
|> String.trim
|> File.read!
|> String.split
|> Enum.count
|> IO.puts
