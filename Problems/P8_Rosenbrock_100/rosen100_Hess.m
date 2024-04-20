% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that computes the Hessian for the Rosenbrock function
%
%           Input: x
%           Output: f(x)
%
function [Hess] = rosen100_Hess(x)

Hess = zeros(length(x), length(x));
for i = 2:99
    Hess(i, i-1) = -400 * x(i-1);
    Hess(i, i) = 202 - 400*x(i+1)+1200*x(i)^2;
    Hess(i, i+1) = -400 * x(i);
end
Hess(1, 1) = 2 - 400*x(2) + 1200*x(1)^2;
Hess(1, 2) = -400*x(1);
Hess(100, 99) = -400 * x(99);
Hess(100, 100) = 200;

end