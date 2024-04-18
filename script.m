% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Script to run code

% close all figures, clear all variables from workspace and clear command
% window
close all
clear all
clc

% set problem
%%%%%%%%%%%%%%%%%%
%%% Quad 10 10 %%%
%%%%%%%%%%%%%%%%%%
problem.name = 'P1_quad_10_10';
rng(0);
problem.x0 = 20*rand(10,1)-10;
problem.n = length(problem.x0);


% set method
%%%%%%%%%%%%%%%%%%%%%%%%%
%%% GD (Backtracking) %%%
%%%%%%%%%%%%%%%%%%%%%%%%%

method.name = 'GradientDescent';
method.options.step_type = 'Backtracking';
method.options.constant_step_size = 1e-3;
method.options.alpha_bar = 1;
method.options.tau = 0.5;
method.options.c1 = 1e-4;


% set options
options.term_tol = 1e-6;
options.max_iterations = 1e3;

% run method and return x^* and f^*
[x,f] = optSolver(problem,method,options);