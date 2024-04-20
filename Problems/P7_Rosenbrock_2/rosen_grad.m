% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that computes the gradient of the Rosenbrock function
%
%           Input: x
%           Output: g = nabla f(x)
%
function [g] = rosen_grad(x)

g = zeros(2,1);
g(1) = -400*x(1)*(x(2) - x(1)^2) + 2*x(1) - 2;
g(2) = -200*x(1)^2 + 200*x(2);

end