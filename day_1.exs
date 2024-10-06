{:ok, contents} = File.read("input.txt")

defmodule FirstLastNumber do
  def of(str) do
    cond do
      String.length(str) == 0 -> "0"
      String.length(str) == 1 -> String.at(str, 0)
      true -> "#{String.at(str, 0)}#{String.at(str, -1)}"
    end
  end
end


  contents
  |> String.split("\n", trim: true)
  |> Enum.map(fn line -> line 
      |> String.replace(~r/[^\d]/, "") 
      |> FirstLastNumber.of()
      |> Integer.parse()
      |> (fn {res, _} -> res end).()
      end)
|> Enum.sum
|> IO.puts
