% IOE 511/MATH 562, University of Michigan
% Code written by: Xihang Yu

% Script to run code

% close all figures, clear all variables from workspace and clear command
% window
close all
clear all
clc


% set problem
% problem 7
%%%%%%%%%%%%%%%%%%%%
%%% Rosenbrock 2 %%%
%%%%%%%%%%%%%%%%%%%%
problem.name = 'P7_Rosenbrock2';
problem.x0 = [-1.2;1];
problem.n = length(problem.x0);
problem.x_star = [1;1];

% set method
%%%%%%%%%%%%%%%%%%%%%%
%%% Newton (Wolfe) %%%
%%%%%%%%%%%%%%%%%%%%%%

method.name = 'Newton';
method.options.step_type = 'Wolfe';
method.options.alpha = 1;
method.options.c1 = 1e-4;
method.options.c2 = 0.5;
method.options.alpha_high = 1000;
method.options.alpha_low = 0;
method.options.c = 0.5;
method.options.beta = 1e-6;

% set options
options.term_tol = 1e-6;
options.max_iterations = 1e3;

% run method and return x^* and f^*
[x,f] = optSolver_Gradient_Pioneers(problem,method,options);
