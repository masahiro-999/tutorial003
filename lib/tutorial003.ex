defmodule Tutorial003 do
  def gen_rand(_) do
    {:rand.uniform(), :rand.uniform()}
  end

  def calc_pi_with_enum() do
    hit =
      1..10_000_000
      |> Enum.map(&gen_rand(&1))
      |> Enum.map(fn {x, y} -> x * x + y * y < 1 end)
      |> Enum.count(fn bool -> bool end)

    hit / 10_000_000 * 4
  end

  def calc_pi_with_flow() do
    hit =
      1..10_000_000
      |> Flow.from_enumerable()
      |> Flow.map(&gen_rand(&1))
      |> Flow.map(fn {x, y} -> x * x + y * y < 1 end)
      |> Enum.count(fn bool -> bool end)

    hit / 10_000_000 * 4
  end

  def calc_pi_with_flow_reduce() do
    hit =
      1..10_000_000
      |> Flow.from_enumerable()
      |> Flow.map(&gen_rand(&1))
      |> Flow.map(fn {x, y} -> x * x + y * y < 1 end)
      |> Flow.reduce(fn -> 0 end, fn entry, acc ->
        if(entry, do: acc + 1, else: acc)
      end)
      |> Flow.on_trigger(fn count -> {[count], count} end)
      |> Enum.sum()

    hit / 10_000_000 * 4
  end
end
