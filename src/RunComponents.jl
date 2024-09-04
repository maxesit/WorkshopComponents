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
initialization_eqns = [
    #msd.body.s ~ 0.0
    msd.body.v ~ 0.0
    msd.body.a ~ 0.0
]
tspan = [0.0,10.0]
prob = ODEProblem(msd, u0, tspan)#; initialization_eqns)
sol  = solve(prob)
using Plots
plot(sol)

# ------------------------------WheelSys-------------------------------- #

using WorkshopComponents
using ModelingToolkit, DifferentialEquations
@mtkbuild whsys = WorkshopComponents.WheelSystem()
u0 = []
tspan = [0.0,20.0]
prob = ODEProblem(whsys, u0, tspan)
sol  = solve(prob)
using Plots
plot(sol)
plot(sol; idxs=whsys.road.o, label= "wsys.road.o")
plot!(sol; idxs=whsys.wheel.body.s, label= "whsys.wheel.body.s")

# ---------------------------------System------------------------------- #

using WorkshopComponents
using ModelingToolkit, DifferentialEquations
@mtkbuild sys = WorkshopComponents.System()
u0 = []
tspan = [0.0,20.0]
sys_inits = [

    sys.seat.body.s ~ 1.5
    sys.seat.body.v ~ 0.0
    sys.seat.body.a ~ 0.0

    sys.carbody.body.s ~ 1.0
    sys.carbody.body.v ~ 0.0
    sys.carbody.body.a ~ 0.0

    sys.wheel.body.s ~ 0.5
    sys.wheel.body.v ~ 0.0
    sys.wheel.body.a ~ 0.0

]
prob = ODEProblem(sys, u0, tspan; initialization_eqns = sys_inits)
sol  = solve(prob; dtmax = 0.1)
using Plots 
plot(sol; idxs=sys.road.u, label= "sys.road.s.u")
plot!(sol; idxs=sys.wheel.body.s, label= "sys.wheel.body.s")
plot!(sol; idxs=sys.carbody.body.s, label= "sys.carbody.body.s")
plot!(sol; idxs=sys.seat.body.s, label= "sys.seat.body.s")


# ---------------------------------------------------------------------- #


#=
    initial body.s = initial_position
    initial body.v = 0.0
    initial body.a = 0.0
=#