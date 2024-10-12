

  ### DO NOT EDIT THIS FILE
### This file is auto-generated by the JSML command-line compiler.
### If you edit this code it is likely to get overwritten.
### Instead, update the JSML source code and regenerate this file

using ModelingToolkit
using ModelingToolkit: t_nounits as t
using OrdinaryDiffEqDefault
using RuntimeGeneratedFunctions
RuntimeGeneratedFunctions.init(@__MODULE__)

D = Differential(t)

@connector __JSML__Pin begin
  v(t), []
  i(t), [connect = Flow]
end
@connector __JSML__Node begin
  T(t), []
  Q(t), [connect = Flow]
end
@connector __JSML__Flange begin
  s(t), []
  f(t), [connect = Flow]
end
@connector __JSML__HydraulicPort begin
  dm(t), [description = "Mass flow rate from the connection point into the component", connect = Flow]
  p(t), [description = "Thermodynamic pressure in the connection point"]
end

include("Damper_definition.jl")
include("FixedGround_definition.jl")
include("Ground_definition.jl")
include("LotkaVolterra_definition.jl")
include("Mass_definition.jl")
include("MassSpringDamper_definition.jl")
include("MassSpringDamperTest_definition.jl")
include("SIR_definition.jl")
include("Spring_definition.jl")
include("SpringDamper_definition.jl")
include("System_definition.jl")
include("VanDerPol_definition.jl")
include("WheelSystem_definition.jl")