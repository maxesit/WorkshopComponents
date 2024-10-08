### DO NOT EDIT THIS FILE
### This file is auto-generated by the JSML command-line compiler.
### If you edit this code it is likely to get overwritten.
### Instead, update the JSML source code and regenerate this file


"""
   Mass(; name, L, m)

Sliding mass

## Parameters: 

| Name         | Description                         | Units  |   Default value |
| ------------ | ----------------------------------- | ------ | --------------- |
| `L`         |                          | m  |   0 |
| `m`         |                          | kg  |   1 |

## Connectors

 * `flange_a` - ([`Flange`](@ref))
 * `flange_b` - ([`Flange`](@ref))

## Variables

| Name         | Description                         | Units  | 
| ------------ | ----------------------------------- | ------ | 
| `s`         | Center of mass                         | m  | 
| `v`         |                          | m/s  | 
| `a`         |                          | m/s2  | 
"""
@component function Mass(; name, L::Union{Float64,Int64,Nothing}=0, m::Union{Float64,Int64,Nothing}=1)
  systems = @named begin
    flange_a = __JSML__Flange()
    flange_b = __JSML__Flange()
  end
  vars = @variables begin
    s(t), [description = "Center of mass", guess = 0.]
    v(t), [guess = 0.]
    a(t), [guess = 0.]
  end
  params = @parameters begin
    (L::Float64 = L)
    (m::Float64 = m)
  end
  eqs = Equation[
    flange_a.s ~ s + L / 2
    flange_b.s ~ s - L / 2
    v ~ D(s)
    a ~ D(v)
    m * a ~ flange_a.f + flange_b.f
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
