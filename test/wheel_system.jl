using WorkshopComponents
using ModelingToolkit, OrdinaryDiffEq

@mtkbuild sys = WorkshopComponents.WheelSystem()
u0 = []
tspan = [0.0, 20.0]
prob = ODEProblem(sys, u0, tspan)
sol  = solve(prob, dtmax = 0.001)

using Plots
plot(sol)
plot!(sol; idxs=sys.ground.flange_a.s, label = "sys.ground.flange_a.s")
savefig("WheelSystem_20s.png")