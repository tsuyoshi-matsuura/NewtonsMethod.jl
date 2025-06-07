module NewtonsMethod

using ForwardDiff, LinearAlgebra

function newtonroot(f, f′, x0; tol = 1E-7, maxiter = 1000)
    # setup the algorithm
    x_old = x0
    normdiff = Inf
    iter = 1
    while normdiff > tol && iter <= maxiter
        x_new = x_old - f(x_old)/f′(x_old)   # use the passed in map
        normdiff = norm(x_new - x_old)
        x_old = x_new
        iter = iter + 1
    end
    if normdiff > tol
        println("Solution not found")
        return nothing
    else
        return (; value = x_old, normdiff, iter) # A named tuple
    end
end

function newtonroot(f, x0; tol = 1E-7, maxiter = 1000)
    D(f) = x -> ForwardDiff.derivative(f, x)
    f′ = D(f)
    newtonroot(f, f′, x0; tol = tol, maxiter = maxiter)
end

export newtonroot

end