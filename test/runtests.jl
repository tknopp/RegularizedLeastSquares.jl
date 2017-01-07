using LinearSolver
using Base.Test

@testset "Linear Solver" begin

A = rand(3,2);
x = rand(2);
b = A*x;

solvers = linearSolverList()

for solver in solvers
  S = createLinearSolver(solver, A, iterations=30)
  x_approx = solve(S,b)
  println("Testing solver $solver ...: $x  == $x_approx")
  @test_approx_eq_eps (norm(x-x_approx)/norm(x)) 0 1e-2
end 
 

end

