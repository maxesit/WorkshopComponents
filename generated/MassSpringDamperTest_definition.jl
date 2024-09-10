### DO NOT EDIT THIS FILE
### This file is auto-generated by the JSML command-line compiler.
### If you edit this code it is likely to get overwritten.
### Instead, update the JSML source code and regenerate this file


"""
   MassSpringDamperTest(; name)

A system with a Mass, Damper, Spring and a Fixed component
"""
@component function MassSpringDamperTest(; name)
  systems = @named begin
    damper = Damper(d=1000)
    spring = Spring(c=1000000, s_rel0=0.5)
    body = Mass(m=1000, L=0)
    ground = FixedGround()
  end
  initialization_eqs = [
    body.flange_b.s ~ 0.5
    body.v ~ 0
    body.flange_b.f ~ 0
  ]
  eqs = Equation[
    connect(spring.flange_a, damper.flange_a, body.flange_b)
  ]
  return ODESystem(eqs, t, [], []; systems, name, initialization_eqs)
end
export MassSpringDamperTest
Base.show(io::IO, a::MIME"image/svg+xml", t::typeof(MassSpringDamperTest)) = print(io,
  """<div style="height: 100%; width: 100%; background-color: white"><div style="margin: auto; height: 500px; width: 500px; padding: 200px"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1000 1000"
    overflow="visible" shape-rendering="geometricPrecision" text-rendering="geometricPrecision">
    <defs>
      <filter id='red-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#ff0000" flood-opacity="0.5"/></filter>
<filter id='green-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#00ff00" flood-opacity="0.5"/></filter>
<filter id='blue-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="100" flood-color="#0000ff" flood-opacity="0.5"/></filter>
<filter id='drop-shadow' color-interpolation-filters="sRGB"><feDropShadow dx="0" dy="0" stdDeviation="40" flood-opacity="0.5"/></filter>
    </defs>
    
    </svg></div></div>""")
