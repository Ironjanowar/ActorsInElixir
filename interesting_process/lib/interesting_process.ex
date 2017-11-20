defmodule InterestingProcess do
  def start() do
    pid = spawn(&loop/0)

    {:ok, pid}
  end

  def loop() do
    receive do
      {pid, :ping} ->
        send pid, {self(), :pong}
        loop()
      {pid, :stop} ->
        send pid, "Okkay I'll stop"
      {pid, _} ->
        send pid, {self(), "Dude..."}
        loop()
      _ -> loop()
    end
  end
end
