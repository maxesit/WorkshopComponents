### DO NOT EDIT THIS FILE
### This file is auto-generated by the JSML command-line compiler.
### If you edit this code it is likely to get overwritten.
### Instead, update the JSML source code and regenerate this file


"""
   Road(; name, bump, freq, loop, offset)

## Parameters: 

| Name         | Description                         | Units  |   Default value |
| ------------ | ----------------------------------- | ------ | --------------- |
| `bump`         |                          | --  |   0.2 |
| `freq`         |                          | --  |   0.5 |
| `loop`         |                          | --  |   10 |
| `offset`         |                          | --  |   1 |

## Connectors

 * `y` - This connector represents a real signal as an output from a component ([`RealOutput`](@ref))
"""
@component function Road(; name, bump::Union{Float64,Int64,Nothing}=0.2, freq::Union{Float64,Int64,Nothing}=0.5, loop::Union{Float64,Int64,Nothing}=10, offset::Union{Float64,Int64,Nothing}=1)
  vars = @variables begin
    y(t), [output = true]
  end
  params = @parameters begin
    (bump::Float64 = bump)
    (freq::Float64 = freq)
    (loop::Float64 = loop)
    (offset::Float64 = offset)
  end
  eqs = Equation[
    y ~ ifelse(mod(t, loop) < offset, 0, ifelse(mod(t, loop) - offset > freq, 0, bump * (1 - cos(2 * π * (t - offset) / freq))))
  ]
  return ODESystem(eqs, t, vars, params; systems = [], name)
end
export Road
Base.show(io::IO, a::MIME"image/svg+xml", t::typeof(Road)) = print(io,
  """<div style="height: 100%; width: 100%; background-color: white"><div style="margin: auto; height: 500px; width: 500px; padding: 200px"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1000 1000"
    overflow="visible" shape-rendering="geometricPrecision" text-rendering="geometricPrecision">
    <defs>
      <filter id='red-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#ff0000" flood-opacity="0.5"/></filter>
<filter id='green-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#00ff00" flood-opacity="0.5"/></filter>
<filter id='blue-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#0000ff" flood-opacity="0.5"/></filter>
<filter id='drop-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="40" flood-opacity="0.5"/></filter>
    </defs>
    
    </svg></div></div>""")
