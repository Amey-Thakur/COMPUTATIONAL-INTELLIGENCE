% =========================================================================
% Self_Organizing_Maps_Kohonen.m
% =========================================================================
% Author: Amey Thakur
% Release Date: April 15, 2024
% GitHub: https://github.com/Amey-Thakur
% License: Creative Commons Attribution 4.0 International (CC BY 4.0)
% =========================================================================
% Abstract:
% This implementation simulates a Kohonen Self-Organizing Map (SOM) 
% algorithm, focusing on the iterative refinement of neuronal activation 
% patterns through lateral interaction. It explores the dynamics of 
% excitation and inhibition within a competitive layer, demonstrating how 
% a localized stimulus propagates and stabilizes across a topographic 
% feature map.
% =========================================================================

clear; clc; format long;

% Algorithmic Hyperparameters
n = 11;       % Population size (number of neurons)
A = 0.1;      % Initial stimulus amplitude
S = 10;       % Saturation threshold parameter
alpha = 7;    % Scaling factor for lateral interaction
a = 2;        % Excitation radius (neighboring neurons)
M = 2*a + 1;  % Effective kernel window size
b = 0.06;     % Excitatory synaptic strength
c = -0.04;    % Inhibitory synaptic strength

% Step 1: Initialization of the Stimulus Profile (Input Profile)
% The input stimulus I_j is modeled as a squared sinusoidal distribution 
% across the neuronal population.
k_0 = Map_Stimulus_Initialization(A, n);
k_0 = char_saturation_function(k_0, S);

fprintf('--- SOM Initial State (k=0) ---\n');
disp(round(k_0, 2));

% Step 2: Iterative Map Evolution (Competitive Refinement)
% The mapping evolves through successive applications of the lateral 
% interaction kernel, demonstrating topographic stabilization.
fprintf('\n--- Topographic Map Evolution ---\n');

k_1 = SOM_Iteration_Step(k_0, a, b, c, M, S, alpha);
fprintf('Iteration k=1:\n');
disp(round(k_1, 2));

k_2 = SOM_Iteration_Step(k_1, a, b, c, M, S, alpha);
fprintf('Iteration k=2:\n');
disp(round(k_2, 2));

k_3 = SOM_Iteration_Step(k_2, a, b, c, M, S, alpha);
fprintf('Iteration k=3:\n');
disp(round(k_3, 2));

% -------------------------------------------------------------------------
% Core Algorithmic Components
% -------------------------------------------------------------------------

function out = SOM_Iteration_Step(y_k, a, b, c, M, S, alpha)
    % Executes a single iteration of the Kohonen lateral interaction cycle.
    total_neuron = length(y_k);
    
    % Definition of the Mexican Hat interaction profile
    left_a = (M+1)-a;
    right_a = (M+1)+a;
    f_j = zeros(1, 2*M + 1);
    
    for ind = 1:length(f_j)
        if ind < left_a || ind > right_a
            f_j(ind) = c; % Lateral Inhibition
        else
            f_j(ind) = b; % On-center Excitation
        end
    end

    % Computation of the feedback dynamics across the topographic map
    out = zeros(1, total_neuron);
    for j = 1:total_neuron
        % Convolution with zero-padding to simulate boundary effects
        receptive_field = circular_zero_padding(y_k, (M+1)-j);
        interaction_sum = alpha * sum(f_j(1:total_neuron) .* receptive_field);
        out(j) = char_saturation_function(interaction_sum, S);
    end
end

function out = circular_zero_padding(input, shiftx)
    % Simulates localized receptive field mapping with zero-boundary 
    % conditions for non-periodic maps.
    out = circshift(input, shiftx);
    if shiftx < 0
        % Mask out trailing elements for lateral shifts
        out(:, (end+shiftx):end) = 0;
    else
        % Mask out leading elements for lateral shifts
        out(:, (1:shiftx)) = 0;
    end
end

function out = Map_Stimulus_Initialization(A, N)
    % Synthesizes the initial external stimulus across the map.
    out = zeros(1, N);
    for j = 0:N-1
        out(j+1) = A * (sin((j * pi) / (N - 1)))^2;
    end
end

function out = char_saturation_function(z, S)
    % Non-linear saturation (clipping) function to simulate neuronal 
    % firing limits.
    out = max(min(z, S), 0);
end

% =========================================================================
% Scholarly Insight: 
% Kohonen Self-Organizing Maps utilize localized lateral interaction to 
% establish topographic order within a neuronal population. By balancing 
% short-range excitation (on-center) with long-range inhibition 
% (off-surround), the network generates an emergent Mexican Hat 
% connectivity pattern. This mechanism allows the map to perform non-
% linear dimensionality reduction while preserving the topological 
% relationships of the input space, effectively modeling the 
% computational principles observed in the mammalian somatosensory and 
% visual cortex.
% =========================================================================
