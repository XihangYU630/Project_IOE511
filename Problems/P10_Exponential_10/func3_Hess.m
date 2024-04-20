% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that computes the Hessian of the Func3 function
%
%           Input: x
%           Output: H = nabla^2 f(x)
%
function [H] = func3_Hess(x)

n = size(x,1);

H = zeros(n,n);
H(1,1) = -2*exp(x(1))*(exp(x(1))-1)/(exp(x(1))+1)^3 + 0.1*exp(-x(1));
for i=2:n
    H(i,i) = 12*(x(i)-1)^2;

end