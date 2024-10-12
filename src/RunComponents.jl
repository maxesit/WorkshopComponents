using Pkg
Pkg.instantiate()

# ----------------------------VanDerPol-------------------------------- #

using WorkshopComponents
using ModelingToolkit, OrdinaryDiffEqDefault

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
using ModelingToolkit, OrdinaryDiffEqDefault

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

# ----------------------------SpringDamper------------------------------ #

using WorkshopComponents
using ModelingToolkit, OrdinaryDiffEqDefault

@mtkbuild sd = WorkshopComponents.SpringDamper()
u0 = [
    sd.x      =>  0.0,
]
tspan = [0.0,0.009]
prob = ODEProblem(sd, u0, tspan)
sol  = solve(prob)
using Plots
plot(sol)

# ---------------------------------MSD---------------------------------- #

using WorkshopComponents
using ModelingToolkit, OrdinaryDiffEqDefault

@mtkbuild sys = WorkshopComponents.MassSpringDamperTest()
u0 = []
tspan = [0.0,4.0]
prob = ODEProblem(sys, u0, tspan)
sol  = solve(prob)

using Plots
plot(sol)
plot!(sol; idxs=sys.ground.flange_a.s, label = "sys.ground.flange_a.s")
savefig("MassSpringDamper.png")

# -----------------------------WheelSystem------------------------------ #

using WorkshopComponents
using ModelingToolkit, OrdinaryDiffEqDefault

@mtkbuild sys = WorkshopComponents.WheelSystem()
u0 = []
tspan = [0.0, 20.0]
prob = ODEProblem(sys, u0, tspan)
sol  = solve(prob, dtmax = 0.001)

using Plots
plot(sol)
plot!(sol; idxs=sys.ground.flange_a.s, label = "sys.ground.flange_a.s")
savefig("WheelSystem_20s.png")

# --------------------------------System-------------------------------- #

using WorkshopComponents
using ModelingToolkit, OrdinaryDiffEqDefault

@mtkbuild sys = WorkshopComponents.VehicleSystem()
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


# ---------------------------------MSD---------------------------------- #
