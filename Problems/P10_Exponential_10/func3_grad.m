% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that computes the Gradient for the Func3 function
%
%           Input: x
%           Output: f(x)
%
function [g] = func3_grad(x)

n = size(x,1);

g = zeros(n,1);
g(1) = 2*exp(x(1))/(exp(x(1))+1)^2 - 0.1*exp(-x(1));
for i=2:n
    g(i) = 4*(x(i)-1)^3;


end