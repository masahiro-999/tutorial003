Benchee.run(
  %{
    "Enum" => fn _ -> Tutorial003.calc_pi_with_enum() end,
    "Flow (count)" => fn _ -> Tutorial003.calc_pi_with_flow() end,
    "Flow (reduce)" => fn _ -> Tutorial003.calc_pi_with_flow_reduce() end
  },
  before_each: fn _ -> :rand.seed(:exsss, {100, 101, 102}) end
)
