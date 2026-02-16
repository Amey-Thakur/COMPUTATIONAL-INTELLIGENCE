% =========================================================================
% File Name: Convolutional_Neural_Network.m
% Author: Amey Thakur
% GitHub Profile: https://github.com/Amey-Thakur
% Repository: https://github.com/Amey-Thakur/COMPUTATIONAL-INTELLIGENCE
% Release Date: April 15, 2024
% License: Creative Commons Attribution 4.0 International (CC BY 4.0)
% 
% Description: 
% Structural analysis and parameter estimation for a Convolutional 
% Neural Network (CNN) layer. The script computes trainable parameter 
% counts, determines output feature map dimensions based on spatial 
% constraints (stride, padding, dilation), and calculates final 
% neuronal density.
% =========================================================================

% -------------------------------------------------------------------------
% 1. Input Image Configuration
% -------------------------------------------------------------------------
% Spatial dimensions and channel depth definition for the input tensor.
% M: Height, N: Width, nC: Color Channels (RGB = 3)
M = 64; 
N = 64; 
nC = 3;

% -------------------------------------------------------------------------
% 2. Convolutional Layer Hyperparameters
% -------------------------------------------------------------------------
% Geometric transformation parameters for the filter kernels.
nF = 8;     % Total independent filters
F1 = 5;     % Filter height
F2 = 5;     % Filter width
D = 4;      % Dilation factor
S = 1;      % Stride
P = 1;      % Zero-padding

% -------------------------------------------------------------------------
% 3. Parameter Estimation (Trainable Weights)
% -------------------------------------------------------------------------
% Calculation of trainable weights per filter and total layer parameters.
% Formula: (FilterHeight * FilterWidth * InputChannels) + Bias

W = (F1 * F2 * nC) + 1;
nW = W * nF;

% -------------------------------------------------------------------------
% 4. Architectural Analysis Output
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
% 5. Spatial Transformation Logic
% -------------------------------------------------------------------------
% Calculation of output feature map dimensions accounting for dilation 
% and stride constraints.
% Effective filter size: Feft = D * (F - 1) + 1
% Output Size: floor((Input + 2*Padding - Feft) / Stride + 1)

M_out = floor((M + 2*P - D*(F1-1) - 1) / S + 1);
N_out = floor((N + 2*P - D*(F2-1) - 1) / S + 1);

fprintf('STEP 1: SPATIAL OUTPUT DIMENSIONS\n');
fprintf('• Output Height (M_out):       floor((%%d + 2*%%d - %%d*(%%d-1) - 1) / %%d + 1) = %%d\n', M, P, D, F1, S, M_out);
fprintf('• Output Width (N_out):        floor((%%d + 2*%%d - %%d*(%%d-1) - 1) / %%d + 1) = %%d\n\n', N, P, D, F2, S, N_out);

% -------------------------------------------------------------------------
% 6. Feature Map Volumetrics
% -------------------------------------------------------------------------
% Determination of individual feature map spatial density.
Mc = M_out; 
Nc = N_out; 

fprintf('STEP 2: FEATURE MAP VOLUMETRICS\n');
fprintf('• Individual Map Size:          [%%d x %%d] = %%d neurons\n\n', Mc, Nc, Mc * Nc);

% -------------------------------------------------------------------------
% 7. Final Neuronal Density
% -------------------------------------------------------------------------
% Total neuronal count calculation for the output volume.
total_neurons = Mc * Nc * nF;

fprintf('STEP 3: TOTAL NEURONAL COUNT\n');
fprintf('• Total Output Neurons:         %%d x %%d x %%d = %%d\n', Mc, Nc, nF, total_neurons);
fprintf('============================================================\n\n');

% -------------------------------------------------------------------------
% Scholarly Insight: Structural Constraints in Deep Architectures
% -------------------------------------------------------------------------
% Architectural parameters such as dilation and stride serve as primary 
% determinants for both the receptive field and the resulting 
% computational density of a convolutional layer. Precise calculation 
% of these spatial constraints is critical for hardware optimization and 
% ensuring appropriate feature extraction resolution. This analysis 
% underscores the scaling relationship between input dimensions and 
% volumetric neuronal density in neural inference models.
