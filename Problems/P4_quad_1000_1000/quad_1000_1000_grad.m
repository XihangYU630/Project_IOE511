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

% Set random number generator seeds
rng(0);

% Generate random data
q = randn(1000,1);
% MATLAB sprandsym function. Inputs: n, density, reciprocal of the 
% condition number, and kind 
% (see https://www.mathworks.com/help/matlab/ref/sprandsym.html)
Q = sprandsym(1000,0.5,1e-3,1);

% compute function value
g = Q*x + q;

end