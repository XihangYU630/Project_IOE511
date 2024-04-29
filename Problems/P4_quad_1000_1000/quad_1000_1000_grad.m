% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Problem Number: 1
% Problem Name: quad_10_10
% Problem Description: A randomly generated convex quadratic function; the 
%                      random seed is set so that the results are 
%                      reproducable. Dimension n = 10; Condition number
%                      kappa = 10

% function that computes the gradient of the quad_10_10 function
function [g] = quad_1000_1000_grad(x)

% Declare variables as persistent so they retain their values between calls
persistent q Q

% Check if persistent variables are empty (first run)
if isempty(q) || isempty(Q)
    % Set random number generator seeds for reproducibility
    rng(0);

    % Generate random data
    q = randn(1000, 1);

    % Generate a sparse symmetric positive definite matrix
    % MATLAB sprandsym function. Inputs: n, density, reciprocal of the 
    % condition number, and kind 
    Q = sprandsym(1000, 0.5, 1e-3, 1);
end

% compute function value
g = Q*x + q;

end