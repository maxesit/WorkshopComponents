using Pkg
Pkg.instantiate()

# ----------------------------VanDerPol-------------------------------- #

using WorkshopComponents
using ModelingToolkit, DifferentialEquations
@mtkbuild vdp = WorkshopComponents.VanDerPol()
u0 = [
    vdp.x => -2.0,
    vdp.y =>  1.0
]
tspan = [0.0,6.3]
prob = ODEProblem(vdp, u0, tspan)
sol  = solve(prob)
using Plots
plot(sol)

# --------------------------------SIR----------------------------------- #

using WorkshopComponents
using ModelingToolkit, DifferentialEquations
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

# ----------------------------Epidemiology------------------------------ #

using WorkshopComponents
using ModelingToolkit, DifferentialEquations
@mtkbuild epi = WorkshopComponents.Epidemiology()
u0 = [
    epi.x      =>  0.0,
    epi.x_dot  =>  0.0,
    epi.x_ddot =>  0.0
]
tspan = [0.0,0.009]
prob = ODEProblem(epi, u0, tspan)
sol  = solve(prob)
using Plots
plot(sol)

# ---------------------------------MSD---------------------------------- #

using WorkshopComponents
using ModelingToolkit, DifferentialEquations
@mtkbuild msd = WorkshopComponents.MassSpringDamper()
u0 = []
tspan = [0.0,10.0]
prob = ODEProblem(msd, u0, tspan)
sol  = solve(prob)
using Plots
plot(sol)
