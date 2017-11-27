defmodule InterestingProcess do
  def start() do
    pid = spawn(&loop/0)

    {:ok, pid}
  end

  def loop() do
    receive do
      {pid, :ping} ->
        send pid, :pong
        loop()
      {pid, :stop} ->
        send pid, "Okkay I'll stop"
      {pid, :plox_mutate} ->
        send pid, "ROAR!"
        loop2()
      {pid, _} ->
        send pid, {self(), "Dude..."}
        loop()
      _ -> loop()
    end
  end

  def loop2() do
    receive do
      {pid, :ping} ->
        send pid, "Meow"
        loop2()
      {pid, :stop} ->
        send pid, "Meow"
        loop2()
      {pid, :plox_mutate} ->
        send pid, {self(), "Prrrrr, nope..."}
        loop2()
      {pid, _} ->
        send pid, "Prrrrr"
        loop2()
      _ -> loop2()
    end
  end
end
