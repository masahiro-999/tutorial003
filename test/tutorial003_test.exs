defmodule Tutorial003Test do
  use ExUnit.Case
  doctest Tutorial003

  test "greets the world" do
    assert Tutorial003.hello() == :world
  end
end
