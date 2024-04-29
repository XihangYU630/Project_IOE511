% IOE 511/MATH 562, University of Michigan
% Code written by: Xihang Yu

% Function that: (1) computes the GD step; (2) updates the iterate; and, 
%                (3) computes the function and gradient at the new iterate
% 
%           Inputs: x, f, g, problem, method, options
%           Outputs: x_new, f_new, g_new, d, alpha
%
function [x_new,f_new,g_new,d,delta,Bk] = TR_Step(x,f,g,problem,method,options,delta,Bk)
    
    c1 = method.options.c1;
    c2 = method.options.c2;
    tolCG = method.options.tolCG;


    % compute hessian
    xk = x;

    % CG Steihaug
    dk = conjugate_gradient_method(Bk, tolCG, xk, delta, problem, method);

    % Evaluate pho_k
    pho_k = (problem.compute_f(xk) - problem.compute_f(xk+dk))/(mx(zeros(problem.n, 1), xk, Bk, problem) - mx(dk, xk, Bk, problem));

    % if-else
    if pho_k > c1
        x_new = xk + dk;
        if pho_k > c2
            delta = 2 * delta;
        end
    else
        x_new = xk;
        delta = 0.5 * delta;
    end
    d = dk;
    f_new = problem.compute_f(x_new);
    g_new = problem.compute_g(x_new);


    s = x_new - x;
    y = g_new - g;
    
    % update Bk
    % compute hessian
    switch method.options.step_type
        case 'SR1'
            if norm((y - Bk * s)' * s) > method.options.c3 * norm(y - Bk * s) * norm(s)
                Bk = Bk + ((y - Bk * s) * (y - Bk * s)') / ((y - Bk * s)' * s);
            end
        case 'Newton'
            Bk = problem.compute_H(x_new);
    end

end


function dk = conjugate_gradient_method(Bk, tolCG, xk, radius, problem, method)
    % Conjugate Gradient method for solving Bx = r.
    %
    % Parameters:
    % - Bk: Symmetric positive definite matrix.
    % - tolCG: Tolerance for the stopping criterion.
    % - xk: Initial guess for the solution.
    % - radius: trust region radius
    %
    % Returns:
    % - dk: The computed direction that approximates the solution.

    % Initial setup
    z0 = zeros(problem.n, 1);
    r0 = problem.compute_g(xk);
    p0 = -problem.compute_g(xk);
    if norm(r0) < tolCG
        dk = z0;
        return
    end
    
    zj = z0;
    rj = r0;
    pj = p0;

    iter = 0;
    
    while iter < method.options.max_iterations_CG
        if pj' * Bk * pj <= 0
            a = pj' * pj;
            b = 2 * (pj' * zj);
            c = zj' * zj - radius^2;
            tau1 = (-b + sqrt(b^2 - 4 * a * c)) / (2 * a);
            tau2 = (-b - sqrt(b^2 - 4 * a * c)) / (2 * a);
            val1 = mx(zj + tau1 * pj, xk, Bk, problem);
            val2 = mx(zj + tau2 * pj, xk, Bk, problem);
            if val1 < val2
                dk = zj + tau1 * pj;
            else
                dk = zj + tau2 * pj;
            end
            return
        end
        
        alpha_j = (rj' * rj) / (pj' * Bk * pj);
        zj1 = zj + alpha_j * pj;
        
        % Check for convergence based on zj+1
        if norm(zj1) >= radius
            a = pj' * pj;
            b = 2 * (pj' * zj);
            c = zj' * zj - radius^2;
            tau1 = (-b + sqrt(b^2 - 4 * a * c)) / (2 * a);
            tau2 = (-b - sqrt(b^2 - 4 * a * c)) / (2 * a);
            val1 = mx(zj + tau1 * pj, xk, Bk, problem);
            val2 = mx(zj + tau2 * pj, xk, Bk, problem);
            if val1 < val2
                dk = zj + tau1 * pj;
            else
                dk = zj + tau2 * pj;
            end
            return
        end
        
        % Update r
        rj1 = rj + alpha_j * Bk * pj;
        
        % Check for convergence based on rj1
        if norm(rj1) <= tolCG
            dk = zj1;
            return
        end
        
        % Update beta and p
        beta_j1 = (rj1' * rj1) / (rj' * rj);
        pj1 = -rj1 + beta_j1 * pj;
        
        % Prepare for the next iteration
        rj = rj1;
        pj = pj1;
        zj = zj1;

        % iter update
        iter = iter + 1;
    end

    dk = z0;
end

function val = mx(d, x, B, problem)
    % Quadratic model mx(d) at x
    %
    % Parameters:
    % - d: direction vector
    % - x: current point as a vector [x1; x2]
    % - B: Hessian matrix or an approximation
    %
    % Returns:
    % - val: Value of the quadratic model at x + d

    g = problem.compute_g(x);   % Assuming grad_f returns column vector
    val = problem.compute_f(x) + g' * d + 0.5 * (d' * B * d);
end