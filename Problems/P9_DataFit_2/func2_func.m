% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that computes the function value for the Func2 function
%
%           Input: x
%           Output: f(x)
%
function [f] = func2_func(x)

y = [1.5;2.25;2.625];
f = (y(1) - x(1) * (1 - x(2)^1))^2 + (y(2) - x(1) * (1 - x(2)^2))^2 + (y(3) - x(1) * (1 - x(2)^3))^2;

end