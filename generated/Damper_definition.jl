### DO NOT EDIT THIS FILE
### This file is auto-generated by the JSML command-line compiler.
### If you edit this code it is likely to get overwritten.
### Instead, update the JSML source code and regenerate this file


"""
   Damper(; name, d)

## Parameters: 

| Name         | Description                         | Units  |   Default value |
| ------------ | ----------------------------------- | ------ | --------------- |
| `d`         |                          | --  |   1000 |

## Connectors

 * `flange_a` - ([`MechanicalPort`](@ref))
 * `flange_b` - ([`MechanicalPort`](@ref))

## Variables

| Name         | Description                         | Units  | 
| ------------ | ----------------------------------- | ------ | 
| `v`         |                          | undefined  | 
| `f`         |                          | undefined  | 
"""
@component function Damper(; name, d::Union{Float64,Int64,Nothing}=1000)
  systems = @named begin
    flange_a = MechanicalPort()
    flange_b = MechanicalPort()
  end
  vars = @variables begin
    v(t), [guess = 0.]
    f(t), [guess = 0.]
  end
  params = @parameters begin
    (d::Float64 = d)
  end
  eqs = Equation[
    v ~ flange_a.v - flange_b.v
    f ~ v * d
    flange_a.f ~ +f
    flange_b.f ~ -f
  ]
  return ODESystem(eqs, t, vars, params; systems, name)
end
export Damper
Base.show(io::IO, a::MIME"image/svg+xml", t::typeof(Damper)) = print(io,
  """<div style="height: 100%; width: 100%; background-color: white"><div style="margin: auto; height: 500px; width: 500px; padding: 200px"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1000 1000"
    overflow="visible" shape-rendering="geometricPrecision" text-rendering="geometricPrecision">
    <defs>
      <filter id='red-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#ff0000" flood-opacity="0.5"/></filter>
<filter id='green-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#00ff00" flood-opacity="0.5"/></filter>
<filter id='blue-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#0000ff" flood-opacity="0.5"/></filter>
<filter id='drop-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="40" flood-opacity="0.5"/></filter>
    </defs>
    
    </svg></div></div>""")
