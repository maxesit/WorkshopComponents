### DO NOT EDIT THIS FILE
### This file is auto-generated by the JSML command-line compiler.
### If you edit this code it is likely to get overwritten.
### Instead, update the JSML source code and regenerate this file


@testset "Running test case1 for VanDerPol" begin
  @mtkbuild model = VanDerPol()
  u0 = [model.x => -2, model.y => 1]
  prob = ODEProblem(model, u0, (0, 6.3))
  sol = solve(prob, DefaultODEAlgorithm())
  @test SciMLBase.successful_retcode(sol)
  @test sol[model.x][end] ≈ -1.9870379786683106
  @test sol[model.y][end] ≈ 0.26239909415305135
end
