% =========================================================================
% File Name: Convolutional_Neural_Network.m
% Author: Amey Thakur
% GitHub Profile: https://github.com/Amey-Thakur
% Repository: https://github.com/Amey-Thakur/COMPUTATIONAL-INTELLIGENCE
% Release Date: April 15, 2024
% License: Creative Commons Attribution 4.0 International (CC BY 4.0)
% 
% Description: 
% This script simulates the structural calculations for a Convolutional 
% Neural Network (CNN) layer. It computes the total number of trainable 
% parameters (weights and biases), determines the output feature map 
% dimensions based on stride, padding, and dilation, and calculates 
% the total neuronal density in the resulting volume. This serves as a 
% fundamental exercise in understanding architectural constraints in 
% deep learning models.
% =========================================================================

% -------------------------------------------------------------------------
% 1. Input Image Configuration
% -------------------------------------------------------------------------
% Define the spatial dimensions and channel depth of the input tensor.
% M: Height, N: Width, nC: Number of Color Channels (e.g., RGB = 3)
M = 64; 
N = 64; 
nC = 3;

% -------------------------------------------------------------------------
% 2. Convolutional Layer Hyperparameters
% -------------------------------------------------------------------------
% These parameters define the geometric transformation applied by the filters.
nF = 8;     % nF: Total number of independent filters (kernels) in the layer
F1 = 5;     % F1: Spatial height of the filter kernel
F2 = 5;     % F2: Spatial width of the filter kernel
D = 4;      % D: Dilation factor (spacing between kernel elements)
S = 1;      % S: Stride (step size of the kernel traversal across the image)
P = 1;      % P: Zero-padding (number of pixel borders added to the input)

% -------------------------------------------------------------------------
% 3. Parameter Estimation (Trainable Weights)
% -------------------------------------------------------------------------
% A convolutional filter's weight count is determined by its kernel size 
% and the depth of the input volume (nC), plus one bias term.

% Calculates weights per single filter: (FilterHeight * FilterWidth * InputChannels) + Bias
W = (F1 * F2 * nC) + 1;

% Calculates total weights for the entire layer: (WeightsPerFilter * TotalFilters)
nW = W * nF;

% -------------------------------------------------------------------------
% 4. Architectural Analysis Output (Console Display)
% -------------------------------------------------------------------------
fprintf('\n============================================================\n');
fprintf('           CONVOLUTIONAL NEURAL NETWORK ARCHITECTURE          \n');
fprintf('============================================================\n');
fprintf('Input Image Dimensions:  [%%d x %%d x %%d]\n', M, N, nC);
fprintf('------------------------------------------------------------\n\n');

fprintf('LAYER HYPERPARAMETERS:\n');
fprintf('• Number of Filters (nF):      %%d\n', nF);
fprintf('• Kernel Size (F1 x F2):       %%d x %%d\n', F1, F2);
fprintf('• Dilation Factor (D):         %%d\n', D);
fprintf('• Stride (S):                  %%d\n', S);
fprintf('• Padding (P):                 %%d\n\n', P);

fprintf('PARAMETER ESTIMATION:\n');
fprintf('• Weights per Filter (W):      (%%d x %%d x %%d) + 1 = %%d\n', F1, F2, nC, W);
fprintf('• Total Layer Weights (nW):    %%d x %%d = %%d\n\n', W, nF, nW);

% -------------------------------------------------------------------------
% 5. Spatial Transformation Logic (Output Dimensionality)
% -------------------------------------------------------------------------
% Calculate the spatial dimensions of the output feature map.
% The formula accounts for padding (P), dilation (D), and stride (S).

% Effective filter size due to dilation: Feft = D * (F - 1) + 1
% Output Size: floor((Input + 2*Padding - Feft) / Stride + 1)

M_out = floor((M + 2*P - D*(F1-1) - 1) / S + 1);
N_out = floor((N + 2*P - D*(F2-1) - 1) / S + 1);

fprintf('STEP 1: SPATIAL OUTPUT DIMENSIONS\n');
fprintf('• Output Height (M_out):       floor((%%d + 2*%%d - %%d*(%%d-1) - 1) / %%d + 1) = %%d\n', M, P, D, F1, S, M_out);
fprintf('• Output Width (N_out):        floor((%%d + 2*%%d - %%d*(%%d-1) - 1) / %%d + 1) = %%d\n\n', N, P, D, F2, S, N_out);

% -------------------------------------------------------------------------
% 6. Feature Map Analysis
% -------------------------------------------------------------------------
% Each filter produces one feature map (channel) in the output volume.
Mc = M_out; 
Nc = N_out; 

fprintf('STEP 2: FEATURE MAP VOLUMETRICS\n');
fprintf('• Individual Map Size:          [%%d x %%d] = %%d neurons\n\n', Mc, Nc, Mc * Nc);

% -------------------------------------------------------------------------
% 7. Final Neuronal Density
% -------------------------------------------------------------------------
% The total number of neurons in the layer's output is the product of 
% feature map spatial size and the total number of filters.
total_neurons = Mc * Nc * nF;

fprintf('STEP 3: TOTAL NEURONAL COUNT\n');
fprintf('• Total Output Neurons:         %%d x %%d x %%d = %%d\n', Mc, Nc, nF, total_neurons);
fprintf('============================================================\n\n');
