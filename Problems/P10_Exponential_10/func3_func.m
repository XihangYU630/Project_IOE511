% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that computes the function value for the Func3 function
%
%           Input: x
%           Output: f(x)
%
function [f] = func3_func(x)

n = size(x,1);
f = (exp(x(1))-1)/(exp(x(1))+1) + 0.1*exp(-x(1));
for i=2:n
    f = f + (x(i)-1)^4;

end