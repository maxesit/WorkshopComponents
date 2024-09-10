"""
Since MassSpringDamper is not a complete system, a component 
MassSpringDamperTest is used, where the bottom flange of the MSD
is fixed to be constantly 0. This makes for a system at the
equilibrium.

"""

using WorkshopComponents
using ModelingToolkit, OrdinaryDiffEq

@mtkbuild sys = WorkshopComponents.MassSpringDamperTest()
u0 = []
tspan = [0.0,4.0]
prob = ODEProblem(sys, u0, tspan)
sol  = solve(prob)

using Plots
plot(sol)
plot!(sol; idxs=sys.ground.flange_a.s, label = "sys.ground.flange_a.s")
savefig("MassSpringDamper.png")