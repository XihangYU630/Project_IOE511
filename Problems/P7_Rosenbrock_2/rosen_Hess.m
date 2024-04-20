% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that computes the Hessian of the Rosenbrock function
%
%           Input: x
%           Output: H = nabla^2 f(x)
%
function [H] = rosen_Hess(x)

H = zeros(2,2);
H(1,1) = 1200*x(1)^2 - 400*x(2) + 2;
H(1,2) = -400*x(1);
H(2,1) = -400*x(1);
H(2,2) = 200;

end