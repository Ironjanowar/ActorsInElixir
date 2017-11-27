defmodule Metex do
  def temperature_of(cities) do
    coordinator_pid = spawn Metex.Coordinator, :loop, [[], Enum.count(cities)]

    cities |> Enum.map(fn city ->
      pid = spawn Metex.Worker, :loop, []
      send pid, {coordinator_pid, city}
    end)
  end
end
