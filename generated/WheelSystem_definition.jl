### DO NOT EDIT THIS FILE
### This file is auto-generated by the JSML command-line compiler.
### If you edit this code it is likely to get overwritten.
### Instead, update the JSML source code and regenerate this file


"""
   WheelSystem(; name)
"""
@component function WheelSystem(; name)
  systems = @named begin
    wheel = MassSpringDamper()
    ground = Ground()
  end
  eqs = Equation[
    connect(wheel.flange_b, ground.flange_a)
  ]
  return ODESystem(eqs, t, [], []; systems, name)
end
export WheelSystem
Base.show(io::IO, a::MIME"image/svg+xml", t::typeof(WheelSystem)) = print(io,
  """<div style="height: 100%; width: 100%; background-color: white"><div style="margin: auto; height: 500px; width: 500px; padding: 200px"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1000 1000"
    overflow="visible" shape-rendering="geometricPrecision" text-rendering="geometricPrecision">
    <defs>
      <filter id='red-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#ff0000" flood-opacity="0.5"/></filter>
<filter id='green-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#00ff00" flood-opacity="0.5"/></filter>
<filter id='blue-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#0000ff" flood-opacity="0.5"/></filter>
<filter id='drop-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="40" flood-opacity="0.5"/></filter>
    </defs>
    
    </svg></div></div>""")
