% =========================================================================
% Radial_Basis_Function_Network.m
% =========================================================================
% Author: Amey Thakur
% Release Date: April 15, 2024
% GitHub: https://github.com/Amey-Thakur
% License: Creative Commons Attribution 4.0 International (CC BY 4.0)
% =========================================================================
% Abstract:
% This implementation explores the architecture and mapping capabilities of 
% Radial Basis Function (RBF) networks. It demonstrates the calculation of 
% Gaussian activation kernels (hidden layer responses) and the estimation 
% of linear output weights using the Moore-Penrose pseudo-inverse method 
% for targeted signal approximation.
% =========================================================================

clear; clc; format long;

% Input Feature Space (Center-aligned patterns)
X1 = [1, 0, 0];
X2 = [0, 1, 0];
X3 = [0, 0, 1];

% Target vectors for associated mapping
T1 = [1, 0, 0];
T2 = [0, 0, 1];

% Desired classification/response vector
D = [1, 0, -1];

% Computation of Gaussian Kernel Activations (G-Matrix)
% The activation g_ij represents the response of hidden unit j to input i, 
% modeled as the exponential of the negative squared Euclidean distance.
g11 = exp(-sum((X1 - T1).^2));
g12 = exp(-sum((X1 - T2).^2));
g21 = exp(-sum((X2 - T1).^2));
g22 = exp(-sum((X2 - T2).^2));
g31 = exp(-sum((X3 - T1).^2));
g32 = exp(-sum((X3 - T2).^2));

% Construction of the Interpolation Matrix G
G = [g11, g12; 
     g21, g22; 
     g31, g32];

% Hidden Layer Augmentation: Inclusion of the bias term (ones vector)
H = [ones(3, 1), G];

% Estimation of Linear Output Weights (W_c)
% Utilizing the pseudo-inverse (pinv) to solve the overdetermined system:
% H * W_c = D'
H_pseudo = pinv(H);
W_c = H_pseudo * D';

% Statistical Output Verification
sum_weights = sum(W_c);

% Terminal Output Generation
fprintf('--- RBF Hidden Layer Activation (H Matrix) ---\n');
disp(H);
fprintf('\n--- Optimized Linear Output Weights (W_c) ---\n');
disp(W_c');
fprintf('Weight Cumulative Sum: %.4f\n', sum_weights);

% =========================================================================
% Scholarly Insight: 
% Radial Basis Function (RBF) networks operate as localized function 
% approximators. By mapping input data into a high-dimensional hidden 
% space through non-linear Gaussian kernels, the network transforms non-
% linearly separable patterns into a space where they can be resolved 
% through simple linear regression. The use of the Moore-Penrose pseudo-
% inverse ensures a least-squares optimal solution for the output 
% weights, providing a mathematically robust mechanism for system 
% identification and pattern categorization.
% =========================================================================
