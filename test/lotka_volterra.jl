using WorkshopComponents, ModelingToolkit
using OrdinaryDiffEq

@mtkbuild lv = LotkaVolterra()
prob = ODEProblem(lv, [lv.x => 1.0, lv.y => 1.0], (0.0,10.0))
sol = solve(prob)

using Plots
plot(sol)
savefig("lotka_voltera.png")