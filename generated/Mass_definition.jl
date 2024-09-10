### DO NOT EDIT THIS FILE
### This file is auto-generated by the JSML command-line compiler.
### If you edit this code it is likely to get overwritten.
### Instead, update the JSML source code and regenerate this file


"""
   Mass(; name, m, g)

## Parameters: 

| Name         | Description                         | Units  |   Default value |
| ------------ | ----------------------------------- | ------ | --------------- |
| `m`         |                          | kg  |   1000 |
| `g`         |                          | m/s2  |   0 |

## Connectors

 * `flange` - ([`Flange`](@ref))

## Variables

| Name         | Description                         | Units  | 
| ------------ | ----------------------------------- | ------ | 
| `v`         |                          | m/s  | 
| `a`         |                          | m/s2  | 
"""
@component function Mass(; name, m::Union{Float64,Int64,Nothing}=1000, g::Union{Float64,Int64,Nothing}=0)
  systems = @named begin
    flange = __JSML__Flange()
  end
  vars = @variables begin
    v(t), [guess = 0.]
    a(t), [guess = 0.]
  end
  params = @parameters begin
    (m::Float64 = m)
    (g::Float64 = g)
  end
  eqs = Equation[
    v ~ D(flange.s)
    a ~ D(v)
    flange.f ~ (a + g) * m
  ]
  return ODESystem(eqs, t, vars, params; systems, name)
end
export Mass
Base.show(io::IO, a::MIME"image/svg+xml", t::typeof(Mass)) = print(io,
  """<div style="height: 100%; width: 100%; background-color: white"><div style="margin: auto; height: 500px; width: 500px; padding: 200px"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1000 1000"
    overflow="visible" shape-rendering="geometricPrecision" text-rendering="geometricPrecision">
    <defs>
      <filter id='red-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#ff0000" flood-opacity="0.5"/></filter>
<filter id='green-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#00ff00" flood-opacity="0.5"/></filter>
<filter id='blue-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#0000ff" flood-opacity="0.5"/></filter>
<filter id='drop-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="40" flood-opacity="0.5"/></filter>
    </defs>
    
    </svg></div></div>""")
