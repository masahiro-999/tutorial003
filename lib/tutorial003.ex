defmodule Tutorial003 do
  def gen_rand(_) do
    {:rand.uniform(),:rand.uniform()}
  end

  def calc_pi_with_enum() do
    hit = 100..100_000_000
    |> Enum.map(&gen_rand(&1))
    |> Enum.map(fn {x,y} -> x*x+y*y <1 end)
    |> Enum.count(fn bool -> bool end)
    hit / 100_000_000 * 4
  end

  def calc_pi_with_flow() do
    hit = 1..100_000_000
    |> Flow.from_enumerable()
    |> Flow.map(&gen_rand(&1))
    |> Flow.map(fn {x,y} -> x*x+y*y <1 end)
    |> Enum.count(fn bool -> bool end)
    hit / 100_000_000 * 4
  end

  def main() do
    {time_enum,_} = :timer.tc(&calc_pi_with_enum/0) |> IO.inspect(label: "enum")
    {time_flow,_} = :timer.tc(&calc_pi_with_flow/0) |> IO.inspect(label: "flow")
    IO.puts("flow/enum speed rate is #{time_enum/time_flow}")
  end

end
