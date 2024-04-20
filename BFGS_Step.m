% IOE 511/MATH 562, University of Michigan
% Code written by: Xihang Yu

% Function that: (1) computes the GD step; (2) updates the iterate; and, 
%                (3) computes the function and gradient at the new iterate
% 
%           Inputs: x, f, g, problem, method, options
%           Outputs: x_new, f_new, g_new, d, alpha
%
function [x_new,f_new,g_new,d,alpha,invHess] = BFGS_Step(x,f,g,problem,method,options,invHess)
    
    n = size(invHess, 1);
    Hess = problem.compute_H(x);
    g = problem.compute_g(x);

    % compute the direction
    d = -invHess*g;

    % determine step size
    switch method.options.step_type
        case 'Backtracking'
            %%% line search %%%
            alpha_bar = method.options.alpha_bar;
            tau = method.options.tau;
            c1 = method.options.c1;
            alpha = alpha_bar;
            while problem.compute_f(x+alpha*d) > f + c1*alpha*g'*d
                alpha = tau * alpha;
            end
            x_new = x + alpha*d;
            f_new = problem.compute_f(x_new);
            g_new = problem.compute_g(x_new);
        case 'Wolfe'
            alpha = method.options.alpha;
            alpha_high = method.options.alpha_high;
            alpha_low = method.options.alpha_low;
            c = method.options.c;
            c1 = method.options.c1;
            c2 = method.options.c2;
    
            while true
                f_test = problem.compute_f(x + alpha * d);
                if f_test <= f + c1 * alpha * g' * d
                    g_test = problem.compute_g(x + alpha * d);
                    if g_test' * d >= c2 * g' * d
                        break;
                    end
                end
                if f_test <= f + c1 * alpha * g' * d
                    alpha_low = alpha;
                else
                    alpha_high = alpha;
                end
                alpha = c * alpha_low + (1-c) * alpha_high;
            end      
    
            x_new = x + alpha*d;
            f_new = problem.compute_f(x_new);
            g_new = problem.compute_g(x_new);
        end
    %%% BFGS propogation
    s = x_new - x;
    y = g_new - g;
    
    if s'*y >= options.term_tol * norm(s)*norm(y)
        invHess = (eye(n) - (s * y')/(s' * y)) * invHess * (eye(n) - (y * s')/(s' * y)) + (s * s')/(s' * y);
    else
        disp('Skip update');
    end
end