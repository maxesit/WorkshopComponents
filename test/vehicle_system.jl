using WorkshopComponents
using ModelingToolkit, OrdinaryDiffEq

@mtkbuild sys = WorkshopComponents.System()
u0 = []
tspan = [0.0, 20.0]
prob = ODEProblem(sys, u0, tspan)
sol  = solve(prob, dtmax = 0.001)

using Plots
plot(sol; idxs=sys.ground.flange_a.s, label = "sys.ground")
plot!(sol;idxs=sys.wheel.flange_a.s, label= "sys.wheel.flange_a.s")
plot!(sol;idxs=sys.chassis.flange_a.s, label="sys.chassis.flange_a.s")
plot!(sol;idxs=sys.seat.flange_a.s, label="sys.seat.flange_a.s")

savefig("System_20s.png")