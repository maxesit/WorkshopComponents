using WorkshopComponents, ModelingToolkit
using OrdinaryDiffEq

@mtkbuild msd = WorkshopComponents.MassSpringDamper()
u0 = []
tspan = [0.0,10.0]
prob = ODEProblem(msd, u0, tspan)
sol  = solve(prob)
using Plots
plot(sol)
savefig("MSD.png")