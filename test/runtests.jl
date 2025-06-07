using NewtonsMethod
using Test

@testset "NewtonsMethod.jl" begin
    f(x) = 3*x^2 - 2*x -1
    f′(x) = 6*x - 2
    root = newtonroot(f, f′, -2/3)
    @test root.normdiff < 1e-7

    root = newtonroot(f, -2/3)
    @test root.normdiff < 1e-7

    f(x) = 3*x^2 - 2*x -1
    f′(x) = 6*x - 2
    root = newtonroot(f, f′, -2/3; maxiter=3)
    @test root == nothing

    f(x) = (x-1.0)^3
    f′(x) = 3*(x-1.0)^2
    root = newtonroot(f,f′,1.1)
    @test root.normdiff < 1e-7

    root = newtonroot(f,1.1)
    @test root.normdiff < 1e-16

    f(x) = 2 + x^2
    f′(x) = 2*x
    root = newtonroot(f,f′,0.1)
    @test root == nothing

    root = newtonroot(f,0.1)
    @test root == nothing  
end
