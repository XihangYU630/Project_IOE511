% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that specifies the problem. Specifically, a way to compute: 
%    (1) function values; (2) gradients; and, (3) Hessians (if necessary).
%
%           Input: problem (struct), required (problem.name)
%           Output: problem (struct)
%
% Error(s): 
%       (1) if problem name not specified;
%       (2) function handles (for function, gradient, Hessian) not found
%
function [problem] = setProblem(problem)

% check is problem name available
if ~isfield(problem,'name')
    error('Problem name not defined!!!')
end

% set function handles according the the selected problem
switch problem.name
        
    case 'P1_quad_10_10'
        
        problem.compute_f = @quad_10_10_func;
        problem.compute_g = @quad_10_10_grad;
        problem.compute_H = @quad_10_10_Hess;
        % Set random number generator seeds
        rng(0);
        q = randn(10,1);
        Q = sprandsym(10,0.5,0.1,1);
        problem.x_star = -Q\q;

    case 'P2_quad_10_1000'
        
        problem.compute_f = @quad_10_1000_func;
        problem.compute_g = @quad_10_1000_grad;
        problem.compute_H = @quad_10_1000_Hess;
        rng(0);
        q = randn(10,1);
        Q = sprandsym(10,0.5,1e-3,1);
        problem.x_star = -Q\q;

    case 'P3_quad_1000_10'
        
        problem.compute_f = @quad_1000_10_func;
        problem.compute_g = @quad_1000_10_grad;
        problem.compute_H = @quad_1000_10_Hess;
        rng(0);
        q = randn(1000,1);
        Q = sprandsym(1000,0.5,0.1,1);
        problem.x_star = -Q\q;

    case 'P4_quad_1000_1000'
        
        problem.compute_f = @quad_1000_1000_func;
        problem.compute_g = @quad_1000_1000_grad;
        problem.compute_H = @quad_1000_1000_Hess;
        rng(0);
        q = randn(1000,1);
        Q = sprandsym(1000,0.5,1e-3,1);
        problem.x_star = -Q\q;

    case 'P5_quartic_1'

        problem.compute_f = @quartic_1_func;
        problem.compute_g = @quartic_1_grad;
        problem.compute_H = @quartic_1_Hess;

    case 'P6_quartic_2'

        problem.compute_f = @quartic_2_func;
        problem.compute_g = @quartic_2_grad;
        problem.compute_H = @quartic_2_Hess;


    case 'P7_Rosenbrock2'
        
        problem.compute_f = @rosen_func;
        problem.compute_g = @rosen_grad;
        problem.compute_H = @rosen_Hess;

    case 'P8_Rosenbrock100'
        
        problem.compute_f = @rosen100_func;
        problem.compute_g = @rosen100_grad;
        problem.compute_H = @rosen100_Hess;
    
    case 'P9_DataFit_2'
        problem.compute_f = @func2_func;
        problem.compute_g = @func2_grad;
        problem.compute_H = @func2_Hess;

    case 'P10_Exponential10'
        problem.compute_f = @func3_func;
        problem.compute_g = @func3_grad;
        problem.compute_H = @func3_Hess;

    case 'P11_Exponential1000'
        problem.compute_f = @func3_func;
        problem.compute_g = @func3_grad;
        problem.compute_H = @func3_Hess;

    case 'P12_Genhumps5'
        
        problem.compute_f = @genhumps_5_func;
        problem.compute_g = @genhumps_5_grad;
        problem.compute_H = @genhumps_5_Hess;

    otherwise
        
        error('Problem not defined!!!')
end