% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that runs a chosen algorithm on a chosen problem
%           Inputs: problem, method, options (structs)
%           Outputs: final iterate (x) and final function value (f)
function [x,f] = optSolver(problem,method,options)

% set problem, method and options
[problem] = setProblem(problem);
[method] = setMethod(method);
[options] = setOptions(options);

% compute initial function/gradient/Hessian
x = problem.x0;
f = problem.compute_f(x);
g = problem.compute_g(x);
H = problem.compute_H(x);
norm_g = norm(g,inf);
init_norm_g = norm_g;

f_record = f;

% f_opt = problem.compute_f(problem.x_star);

% set initial iteration counter
k = 0;
invHess = eye(size(H, 1));

switch method.name
    case 'TrustRegion'
        delta = method.options.delta0;
        Bk = eye(size(H, 1));
end

while norm_g > options.term_tol*max(init_norm_g, 1) && k < options.max_iterations
    
    % take step according to a chosen method
    switch method.name
        case 'GradientDescent'
            [x_new,f_new,g_new,d,alpha] = GDStep(x,f,g,problem,method,options);
        case 'Newton'
            [x_new,f_new,g_new,d,alpha] = NewtonStep(x,f,g,problem,method,options);
        case 'BFGS'
            [x_new,f_new,g_new,d,alpha,invHess] = BFGS_Step(x,f,g,problem,method,options,invHess);
        case 'TrustRegion'
            [x_new,f_new,g_new,d,delta, Bk] = TR_Step(x,f,g,problem,method,options,delta,Bk);
        case 'DFP'
            [x_new,f_new,g_new,d,alpha,invHess] = DFP_Step(x,f,g,problem,method,options,invHess);
        otherwise
            
            error('Method not implemented yet!')
            
    end
    
    % update old and new function values
    x_old = x; f_old = f; g_old = g; norm_g_old = norm_g;
    x = x_new; f = f_new; g = g_new; norm_g = norm(g,inf);
    
    % Record the new f value
    f_record = [f_record, f_new]; 

    % increment iteration counter
    k = k + 1;
    
end

hold on;
% log_f_diff = log10(f_diff);
plot(0:k, f_record, '-o');
title('Convergence of f towards f_{opt} over iterations');
grid on;

end