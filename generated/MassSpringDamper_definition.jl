### DO NOT EDIT THIS FILE
### This file is auto-generated by the JSML command-line compiler.
### If you edit this code it is likely to get overwritten.
### Instead, update the JSML source code and regenerate this file


"""
   MassSpringDamper(; name, mass, gravity, stiffness, damping, initial_position)

## Parameters: 

| Name         | Description                         | Units  |   Default value |
| ------------ | ----------------------------------- | ------ | --------------- |
| `mass`         |                          | --  |   1000 |
| `gravity`         |                          | --  |   0 |
| `stiffness`         |                          | --  |   1000000 |
| `damping`         |                          | --  |   1000 |
| `initial_position`         |                          | --  |   0 |

## Connectors

 * `port_m` - ([`MechanicalPort`](@ref))
 * `port_sd` - ([`MechanicalPort`](@ref))
"""
@component function MassSpringDamper(; name, mass::Union{Float64,Int64,Nothing}=1000, gravity::Union{Float64,Int64,Nothing}=0, stiffness::Union{Float64,Int64,Nothing}=1000000, damping::Union{Float64,Int64,Nothing}=1000, initial_position::Union{Float64,Int64,Nothing}=0)
  systems = @named begin
    port_m = MechanicalPort()
    port_sd = MechanicalPort()
    damper = Damper(d=damping)
    body = Mass(m=mass, g=gravity)
    spring = Spring(k=stiffness)
  end
  params = @parameters begin
    (mass::Float64 = mass)
    (gravity::Float64 = gravity)
    (stiffness::Float64 = stiffness)
    (damping::Float64 = damping)
    (initial_position::Float64 = initial_position)
  end
  initialization_eqs = [
    body.s ~ initial_position
    body.v ~ 0
    body.a ~ 0
  ]
  eqs = Equation[
    connect(damper.flange_a, spring.flange_a, body.flange, port_m)
    connect(port_sd, spring.flange_b, damper.flange_b)
  ]
  return ODESystem(eqs, t, [], params; systems, name, initialization_eqs)
end
export MassSpringDamper
Base.show(io::IO, a::MIME"image/svg+xml", t::typeof(MassSpringDamper)) = print(io,
  """<div style="height: 100%; width: 100%; background-color: white"><div style="margin: auto; height: 500px; width: 500px; padding: 200px"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1000 1000"
    overflow="visible" shape-rendering="geometricPrecision" text-rendering="geometricPrecision">
    <defs>
      <filter id='red-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#ff0000" flood-opacity="0.5"/></filter>
<filter id='green-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#00ff00" flood-opacity="0.5"/></filter>
<filter id='blue-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#0000ff" flood-opacity="0.5"/></filter>
<filter id='drop-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="40" flood-opacity="0.5"/></filter>
    </defs>
    
    </svg></div></div>""")
