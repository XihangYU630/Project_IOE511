% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that computes the Hessian of the Func2 function
%
%           Input: x
%           Output: H = nabla^2 f(x)
%
function [H] = func2_Hess(x)

y = [1.5;2.25;2.625];

H = zeros(2,2);
H(1,1) = 2*(1-x(2)^1)^2 + 2*(1-x(2)^2)^2 + 2*(1-x(2)^3)^2;
H(1,2) = 2*y(1)-4*x(1)-4*x(1)*x(2)+4*y(2)*x(2)+8*x(1)*x(2)^3+6*y(3)*x(2)^2-12*x(1)*x(2)^2+12*x(1)*x(2)^5;
H(2,1) = 2*y(1)-4*x(1)-4*x(1)*x(2)+4*y(2)*x(2)+8*x(1)*x(2)^3+6*y(3)*x(2)^2-12*x(1)*x(2)^2+12*x(1)*x(2)^5;
H(2,2) = x(1)^2*(-2-12*x(2)+12*x(2)^2+30*x(2)^4) + 4*x(1)*y(2)+12*x(1)*y(3)*x(2);

end