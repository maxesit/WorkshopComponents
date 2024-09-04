using WorkshopComponents, ModelingToolkit
using OrdinaryDiffEq

@mtkbuild sir = WorkshopComponents.SIR()
u0 = [
    sir.S =>  10000.0,
    sir.I =>  50.0,
    sir.R =>  0.0
]
tspan = [0.0,20.0]
prob = ODEProblem(sir, u0, tspan)
sol  = solve(prob)
using Plots
plot(sol)