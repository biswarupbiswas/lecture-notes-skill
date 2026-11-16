# Example companion script for /lecture (illustration of style only).
# MA3113, Module 3, Lecture 3: the Jacobi method for symmetric matrices
# Run with:  julia jacobi.jl

using LinearAlgebra

# off(A)^2 = sum of squares of the off-diagonal entries
off(A) = norm(A - Diagonal(A))

# One Jacobi rotation in the (p,q) plane, written out as in Algorithm 1 (lines 6-16).
# Returns P'AP and QP, where P is the identity except
# P[p,p] = P[q,q] = c, P[p,q] = -s, P[q,p] = s; in the result A[p,q] = 0.
function rotate(A, Q, p, q)
    A = copy(A)
    Q = copy(Q)
    A[p, q] == 0 && return A, Q
    if A[p, p] == A[q, q]
        theta = pi / 4
    else
        theta = atan(2A[p, q] / (A[p, p] - A[q, q])) / 2   # tan(2 theta) = 2a_pq/(a_pp - a_qq)
    end
    c, s = cos(theta), sin(theta)
    alpha, beta, gamma = A[p, p], A[q, q], A[p, q]          # keep the old values
    n = size(A, 1)
    for j in 1:n                                            # rows and columns p, q
        (j == p || j == q) && continue
        u, v = A[p, j], A[q, j]
        A[p, j] = c * u + s * v
        A[q, j] = -s * u + c * v
        A[j, p] = A[p, j]                                   # symmetry
        A[j, q] = A[q, j]
    end
    A[p, p] = c^2 * alpha + 2s * c * gamma + s^2 * beta
    A[q, q] = s^2 * alpha - 2s * c * gamma + c^2 * beta
    A[p, q] = 0
    A[q, p] = 0
    for i in 1:n                                            # Q <- QP: columns p, q of Q
        u, v = Q[i, p], Q[i, q]
        Q[i, p] = c * u + s * v
        Q[i, q] = -s * u + c * v
    end
    return A, Q
end

# Classical Jacobi: always rotate on the largest off-diagonal entry
function classical_jacobi(A; tol = 1e-10, maxrot = 1000)
    Q = Matrix(1.0I, size(A))
    k = 0
    while off(A) > tol && k < maxrot
        p, q = Tuple(argmax(abs.(triu(A, 1))))    # largest entry above the diagonal
        A, Q = rotate(A, Q, p, q)
        k += 1
        println(k, "  rotate on (", p, ",", q, ")  diag = ", round.(diag(A), digits = 5),
                "  off^2 = ", round(off(A)^2, sigdigits = 3))
    end
    return diag(A), Q
end

# Cyclic Jacobi (Algorithm 1 of the notes): sweep over (1,2), (1,3), ..., (n-1,n)
function cyclic_jacobi(A; tol = 1e-12, maxsweeps = 50)
    n = size(A, 1)
    Q = Matrix(1.0I, n, n)
    sweeps = 0
    while off(A) > tol * norm(A) && sweeps < maxsweeps
        for p in 1:n-1, q in p+1:n
            A, Q = rotate(A, Q, p, q)
        end
        sweeps += 1
    end
    return diag(A), Q, sweeps
end


println("Example 1")
A = [1 sqrt(2) 2; sqrt(2) 3 sqrt(2); 2 sqrt(2) 1]
lam, Q = classical_jacobi(A)
println("eigenvalues: ", round.(lam, digits = 10))
println("eigenvectors (columns):")
display(round.(Q, digits = 5))

println("\nExample 2")
A = [2.0 1 0; 1 2 1; 0 1 2]
lam, Q = classical_jacobi(A; maxrot = 6)

println("\nCyclic Jacobi on random symmetric matrices")
for n in (10, 50, 100)
    R = randn(n, n)
    S = (R + R') / 2
    d, _, sweeps = cyclic_jacobi(S)
    err = maximum(abs.(sort(d) - eigvals(S)))
    println("n = ", n, ": ", sweeps, " sweeps, max eigenvalue error = ", round(err, sigdigits = 2))
end
