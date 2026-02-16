% =========================================================================
% Radial_Basis_Function_Optimization.m
% =========================================================================
% Author: Amey Thakur
% Release Date: April 15, 2024
% GitHub: https://github.com/Amey-Thakur
% License: Creative Commons Attribution 4.0 International (CC BY 4.0)
% =========================================================================
% Abstract:
% This implementation demonstrates the matrix algebraic optimization of 
% Radial Basis Function (RBF) network weights. It performs the explicit 
% calculation of the Moore-Penrose pseudo-inverse using the Normal 
% Equations approach (H'H)^(-1)H' to resolve the optimal weight vector for 
% a specified mapping problem.
% =========================================================================

clear; clc; format long;

% Augmented Hidden Layer Response Matrix (H)
% Includes bias units and Gaussian kernel responses.
H = [1, 1,      0.367879; 
     1, 0.444858, 0.163654; 
     1, 0.367879, 1; 
     1, 0.163654, 0.444858];

% Target Desired Output Vector (D)
D = [1, 0, 0, 0];

% Moore-Penrose Pseudo-inverse Computation (Normal Equations Method)
% Process: H* = (H' * H)^(-1) * H'
H_trans = H';
H_gram = H_trans * H;
H_inv = inv(H_gram);
H_pseudo = H_inv * H_trans;

% Optimized Weight Vector Calculation
w_optimized = H_pseudo * D';

% Verification of selection pressure and weights
weight_sum = sum(w_optimized);

% Terminal Output Generation
fprintf('--- RBF Algebraic Weight Optimization ---\n');
fprintf('Calculated Weight Vector:\n');
disp(w_optimized');
fprintf('Composite Weight Sum: %.8f\n', weight_sum);

% =========================================================================
% Scholarly Insight: 
% The optimization of RBF output weights through the Normal Equations 
% method guarantees the minimization of the sum of squared errors. By 
% explicitly computing the grammatical inverse of the hidden layer 
% responses, the network converges to the optimal linear projection in 
% a single iteration. This deterministic approach contrasts with 
% stochastic gradient methods, offering superior convergence speed and 
% stability for networks where the kernel parameters are fixed.
% =========================================================================
