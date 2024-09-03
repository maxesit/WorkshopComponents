

  ### DO NOT EDIT THIS FILE
### This file is auto-generated by the JSML command-line compiler.
### If you edit this code it is likely to get overwritten.
### Instead, update the JSML source code and regenerate this file

using ModelingToolkit
using ModelingToolkit: t_nounits as t
using DifferentialEquations
using OrdinaryDiffEq: ReturnCode.Success
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

include("Epidemiology_definition.jl")
include("MechanicalPort_definition.jl")
include("SIR_definition.jl")
include("VanDerPol_definition.jl")