### DO NOT EDIT THIS FILE
### This file is auto-generated by the JSML command-line compiler.
### If you edit this code it is likely to get overwritten.
### Instead, update the JSML source code and regenerate this file


"""
   VanDerPol(; name, mu)

## Parameters: 

| Name         | Description                         | Units  |   Default value |
| ------------ | ----------------------------------- | ------ | --------------- |
| `mu`         |                          | --  |   1 |

## Variables

| Name         | Description                         | Units  | 
| ------------ | ----------------------------------- | ------ | 
| `x`         |                          | undefined  | 
| `y`         |                          | undefined  | 
"""
@component function VanDerPol(; name, mu::Union{Float64,Int64,Nothing}=1)
  vars = @variables begin
    x(t), [guess = 0.]
    y(t), [guess = 0.]
  end
  params = @parameters begin
    (mu::Float64 = mu)
  end
  eqs = Equation[
    D(y) ~ mu * ((1 - x ^ 2) * y - x)
    D(x) ~ y
  ]
  return ODESystem(eqs, t, vars, params; systems = [], name)
end
export VanDerPol
Base.show(io::IO, a::MIME"image/svg+xml", t::typeof(VanDerPol)) = print(io,
  """<div style="height: 100%; width: 100%; background-color: white"><div style="margin: auto; height: 500px; width: 500px; padding: 200px"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1000 1000"
    overflow="visible" shape-rendering="geometricPrecision" text-rendering="geometricPrecision">
    <defs>
      <filter id='red-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#ff0000" flood-opacity="0.5"/></filter>
<filter id='green-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#00ff00" flood-opacity="0.5"/></filter>
<filter id='blue-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#0000ff" flood-opacity="0.5"/></filter>
<filter id='drop-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="40" flood-opacity="0.5"/></filter>
    </defs>
    
    </svg></div></div>""")
