IO.gets("Filename:  ")
|> String.trim
|> File.read!
|> String.split
|> length
|> IO.puts
