% IOE 511/MATH 562, University of Michigan
% Code written by: Xihang Yu

% Script to run code

% close all figures, clear all variables from workspace and clear command
% window
close all
clear all
clc

figure;
xlabel('Iteration k');
ylabel('Function Value');


% set method
%%%%%%%%%%%%%%%%%%%%%%%%%
%%% GD (Backtracking) %%%
%%%%%%%%%%%%%%%%%%%%%%%%%

% method.name = 'GradientDescent';
% method.options.step_type = 'Backtracking';
% method.options.alpha_bar = 1;
% method.options.tau = 0.5;
% method.options.c1 = 1e-4;
% 
% % set options
% options.term_tol = 1e-6;
% options.max_iterations = 1e3;

%%%%%%%%%%%%%%%%%%
%%% GD (Wolfe) %%%
%%%%%%%%%%%%%%%%%%

% method.name = 'GradientDescent';
% method.options.step_type = 'Wolfe';
% method.options.alpha = 1;
% method.options.c1 = 1e-4;
% method.options.c2 = 0.5;
% method.options.alpha_high = 1000;
% method.options.alpha_low = 0;
% method.options.c = 0.5;
% 
% % set options
% options.term_tol = 1e-6;
% options.max_iterations = 1e3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Newton (Backtracking) %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% method.name = 'Newton';
% method.options.step_type = 'Backtracking';
% method.options.alpha_bar = 1;
% method.options.tau = 0.5;
% method.options.c1 = 1e-4;
% method.options.beta = 1e-6;
% 
% % set options
% options.term_tol = 1e-6;
% 
% options.max_iterations = 1e3;

%%%%%%%%%%%%%%%%%%%%%%
%%% Newton (Wolfe) %%%
%%%%%%%%%%%%%%%%%%%%%%

% method.name = 'Newton';
% method.options.step_type = 'Wolfe';
% method.options.alpha = 1;
% method.options.c1 = 1e-4;
% method.options.c2 = 0.5;
% method.options.alpha_high = 1000;
% method.options.alpha_low = 0;
% method.options.c = 0.5;
% method.options.beta = 1e-6;
% 
% % set options
% options.term_tol = 1e-6;
% options.max_iterations = 1e3;

%%%%%%%%%%%%%%%%%%
%%% TRNewtonCG %%%
%%%%%%%%%%%%%%%%%%

% method.name = 'TrustRegion';
% method.options.step_type = 'Newton';
% method.options.delta0 = 2;
% method.options.c1 = 1e-3;
% method.options.c2 = 0.5;
% method.options.tolCG = 1e-10;
% method.options.max_iterations_CG = 1e3;
% 
% % set options
% options.term_tol = 1e-6;
% options.max_iterations = 1e3;

%%%%%%%%%%%%%%%%%%
%%% TRSR1CG %%%
%%%%%%%%%%%%%%%%%%

% method.name = 'TrustRegion';
% method.options.step_type = 'SR1';
% method.options.delta0 = 2;
% method.options.c1 = 1e-3;
% method.options.c2 = 0.5;
% method.options.c3 = 1e-6;
% method.options.tolCG = 1e-10;
% method.options.max_iterations_CG = 1e3;
% 
% % set options
% options.term_tol = 1e-6;
% options.max_iterations = 1e3;


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% BFGS (Backtracking) %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

% method.name = 'BFGS';
% method.options.step_type = 'Backtracking';
% method.options.alpha_bar = 1;
% method.options.tau = 0.5;
% method.options.c1 = 1e-4;
% method.options.beta = 1e-6;
% 
% % set options
% options.term_tol = 1e-6;
% options.max_iterations = 1e3;

%%%%%%%%%%%%%%%%%%%%
%%% BFGS (Wolfe) %%%
%%%%%%%%%%%%%%%%%%%%

% method.name = 'BFGS';
% method.options.step_type = 'Wolfe';
% method.options.alpha = 1;
% method.options.c1 = 1e-4;
% method.options.c2 = 0.5;
% method.options.alpha_high = 1000;
% method.options.alpha_low = 0;
% method.options.c = 0.5;
% 
% % set options
% options.term_tol = 1e-6;
% options.max_iterations = 1e3;

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DFP (Backtracking) %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%

% method.name = 'DFP';
% method.options.step_type = 'Backtracking';
% method.options.alpha_bar = 1;
% method.options.tau = 0.5;
% method.options.c1 = 1e-4;
% method.options.beta = 1e-6;
% 
% % set options
% options.term_tol = 1e-6;
% options.max_iterations = 1e3;

%%%%%%%%%%%%%%%%%%%
%%% DFP (Wolfe) %%%
%%%%%%%%%%%%%%%%%%%

method.name = 'DFP';
method.options.step_type = 'Wolfe';
method.options.alpha = 1;
method.options.c1 = 1e-4;
method.options.c2 = 0.5;
method.options.alpha_high = 1000;
method.options.alpha_low = 0;
method.options.c = 0.5;

% set options
options.term_tol = 1e-6;
options.max_iterations = 1e3;

% set problem
% problem 1
%%%%%%%%%%%%%%%%%%
%%% Quad 10 10 %%%
%%%%%%%%%%%%%%%%%%
problem.name = 'P1_quad_10_10';
rng(0);
problem.x0 = 20*rand(10,1)-10;
problem.n = length(problem.x0);

% run method and return x^* and f^*
[x,f] = optSolver(problem,method,options);

% problem 2
%%%%%%%%%%%%%%%%%%%%
%%% Quad 10 1000 %%%
%%%%%%%%%%%%%%%%%%%%
problem.name = 'P2_quad_10_1000';
rng(0);
problem.x0 = 20*rand(10,1)-10;
problem.n = length(problem.x0);

% run method and return x^* and f^*
[x,f] = optSolver(problem,method,options);

% problem 3
%%%%%%%%%%%%%%%%%%%%
%%% Quad 1000 10 %%%
%%%%%%%%%%%%%%%%%%%%
problem.name = 'P3_quad_1000_10';
rng(0);
problem.x0 = 20*rand(1000,1)-10;
problem.n = length(problem.x0);

% run method and return x^* and f^*
[x,f] = optSolver(problem,method,options);

% problem 4
%%%%%%%%%%%%%%%%%%%%%%
%%% Quad 1000 1000 %%%
%%%%%%%%%%%%%%%%%%%%%%
problem.name = 'P4_quad_1000_1000';
rng(0);
problem.x0 = 20*rand(1000,1)-10;
problem.n = length(problem.x0);

% run method and return x^* and f^*
[x,f] = optSolver(problem,method,options);

% problem 5
%%%%%%%%%%%%%%%%%
%%% Quartic 1 %%%
%%%%%%%%%%%%%%%%%
problem.name = 'P5_quartic_1';
problem.x0 = [cos(70*pi/180); sin(70*pi/180); cos(70*pi/180); sin(70*pi/180)];
problem.n = length(problem.x0);

% run method and return x^* and f^*
[x,f] = optSolver(problem,method,options);

% problem 6
%%%%%%%%%%%%%%%%%
%%% Quartic 2 %%%
%%%%%%%%%%%%%%%%%
problem.name = 'P6_quartic_2';
problem.x0 = [cos(70*pi/180); sin(70*pi/180); cos(70*pi/180); sin(70*pi/180)];
problem.n = length(problem.x0);

% run method and return x^* and f^*
[x,f] = optSolver(problem,method,options);

% problem 7
%%%%%%%%%%%%%%%%%%%%
%%% Rosenbrock 2 %%%
%%%%%%%%%%%%%%%%%%%%
problem.name = 'P7_Rosenbrock2';
problem.x0 = [-1.2;1];
problem.n = length(problem.x0);
problem.x_star = [1;1];

% run method and return x^* and f^*
[x,f] = optSolver(problem,method,options);

% problem 8
%%%%%%%%%%%%%%%%%%%%%%
%%% Rosenbrock 100 %%%
%%%%%%%%%%%%%%%%%%%%%%
problem.name = 'P8_Rosenbrock100';
problem.n = 100;
problem.x0 = ones(problem.n,1);
problem.x0(1) = -1.2;
problem.x_star = ones(problem.n,1);

% run method and return x^* and f^*
[x,f] = optSolver(problem,method,options);

% problem 9
%%%%%%%%%%%%%%%%%
%%% DataFit 2 %%%
%%%%%%%%%%%%%%%%%
problem.name = 'P9_DataFit_2';
problem.x0 = [1;1];
problem.n = length(problem.x0);
problem.x_star = [3;0.5];

% run method and return x^* and f^*
[x,f] = optSolver(problem,method,options);


% problem 10
%%%%%%%%%%%%%%%%%%%%%%
%%% Exponential 10 %%%
%%%%%%%%%%%%%%%%%%%%%%
problem.name = 'P10_Exponential10';
problem.n = 10;
problem.x0 = zeros(problem.n,1);
problem.x0(1) = 1;
problem.x_star = ones(problem.n, 1);
problem.x_star(1) = log((1+2*sqrt(5))/19);

% run method and return x^* and f^*
[x,f] = optSolver(problem,method,options);

% problem 11
%%%%%%%%%%%%%%%%%%%%%%%%
%%% Exponential 1000 %%%
%%%%%%%%%%%%%%%%%%%%%%%%
problem.name = 'P11_Exponential1000';
problem.n = 1000;
problem.x0 = zeros(problem.n,1);
problem.x0(1) = 1;
problem.x_star = ones(problem.n, 1);
problem.x_star(1) = log((1+2*sqrt(5))/19);

% run method and return x^* and f^*
[x,f] = optSolver(problem,method,options);

% problem 12
%%%%%%%%%%%%%%%%%%
%%% Genhumps 5 %%%
%%%%%%%%%%%%%%%%%%
problem.name = 'P12_Genhumps5';
problem.n = 5;
problem.x0 = [-506.2; 506.2; 506.2; 506.2; 506.2];

% run method and return x^* and f^*
[x,f] = optSolver(problem,method,options);



%% plot legend
legend('Gradient Descent (Backtracking)','Gradient Descent (Wolfe)','Newton (Backtracking)','Newton (Wolfe)','TRNewtonCG','TRSR1CG','BFGS (Backtracking)','BFGS (Wolfe)','DFP (Backtracking)','DFP (Wolfe)');
