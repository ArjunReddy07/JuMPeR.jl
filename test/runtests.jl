using JuMPeR
using Base.Test
solver = JuMPeR.JuMP.UnsetSolver()
if Pkg.installed("Gurobi") != nothing
    using Gurobi
    solver = GurobiSolver(OutputFlag=0)
    println("Selected Gurobi as solver")
end

tests = [   "operators.jl",
            "macro.jl",
            "polyhedral.jl",
            "bertsim.jl",
            "oracle.jl",
            "ellipse.jl",
            "scenario.jl",
            "resolve.jl"]

println("Running tests...")
for curtest in tests
    println("Test: $curtest")
    include(curtest)
end