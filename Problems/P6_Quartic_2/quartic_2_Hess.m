% IOE 511/MATH 562, University of Michigan
% Code written by: Xihang Yu

% Problem Number: 6
% Problem Name: quartic_2
% Problem Description: A quartic function. Dimension n = 4

% function that computes the gradient of the quartic_2 function
function [Hess] = quartic_2_Hess(x)

% Matrix Q
Q = [5 1 0 0.5;
     1 4 0.5 0;
     0 0.5 3 0;
     0.5 0 0 2];
 
% Set sigma value
sigma = 1e4;

% compute function value
Hess = eye(length(x)) + 2 * sigma * (Q * x * x' * Q) + sigma * (x' * Q * x) * Q;

end