using WorkshopComponents, ModelingToolkit
using OrdinaryDiffEq

@mtkbuild vdp = VanDerPol()
prob = ODEProblem(vdp, [vdp.x => -2.0, vdp.y => 1.0], (0.0,2π))
sol = solve(prob)

using Plots
plot(sol)