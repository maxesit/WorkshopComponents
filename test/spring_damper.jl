using WorkshopComponents, ModelingToolkit
using OrdinaryDiffEq

@mtkbuild sd = WorkshopComponents.SpringDamper()
u0 = [
    sd.x      =>  0.0,
    sd.x_dot  =>  0.0,
    sd.x_ddot =>  0.0
]
tspan = [0.0,0.009]
prob = ODEProblem(sd, u0, tspan)
sol  = solve(prob)
using Plots
plot(sol)
savefig("spring_damper.png")