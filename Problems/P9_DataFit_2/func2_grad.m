% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that computes the gradient of the Func2 function
%
%           Input: x
%           Output: g = nabla f(x)
%
function [g] = func2_grad(x)

y = [1.5;2.25;2.625];
g = zeros(2,1);
g(1) = 2*(y(1) - x(1)*(1 - x(2)^1))*(-(1-x(2)^1)) + 2*(y(2) - x(1)*(1 - x(2)^2))*(-(1-x(2)^2)) + 2*(y(3) - x(1)*(1 - x(2)^3))*(-(1-x(2)^3));
g(2) = 2*(y(1) - x(1)*(1 - x(2)^1))*(x(1)*x(2)^0) + 2*(y(2) - x(1)*(1 - x(2)^2))*(2*x(1)*x(2)^1) + 2*(y(3) - x(1)*(1 - x(2)^3))*(3*x(1)*x(2)^2);

end