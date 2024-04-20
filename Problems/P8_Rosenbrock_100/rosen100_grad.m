% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that computes the gradient for the Rosenbrock function
%
%           Input: x
%           Output: g(x)
%
function [g] = rosen100_grad(x)

g = zeros(length(x), 1);
for i = 2:99
    g(i) = 200*(x(i) - x(i-1)^2) - 2*(1-x(i)) - 400*(x(i+1)-x(i)^2)*x(i);
end
g(1) = -2*(1-x(1)) - 400*(x(2)-x(1)^2)*x(1);
g(100) = 200*(x(100)-x(99)^2);

end