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

% set initial iteration counter
k = 0;

while norm_g > options.term_tol*max(init_norm_g, 1) && k <options.max_iterations
    
    % take step according to a chosen method
    switch method.name
        case 'GradientDescent'
            [x_new,f_new,g_new,d,alpha] = GDStep(x,f,g,problem,method,options);
        case 'Newton'
            
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

figure;
xlabel('Iteration k');
ylabel('Function value');

hold on;
f_diff = f_record;
log_f_diff = log10(f_diff);
plot(0:k, log_f_diff, '-o');
title('Convergence of f towards f_{opt} over iterations');
grid on;
ylim([log(1e-7), log(1e3)]);

end