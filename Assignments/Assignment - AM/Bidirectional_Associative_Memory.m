% =========================================================================
% Bidirectional_Associative_Memory.m
% =========================================================================
% Author: Amey Thakur
% Release Date: April 15, 2024
% GitHub: https://github.com/Amey-Thakur
% License: Creative Commons Attribution 4.0 International (CC BY 4.0)
% =========================================================================
% Abstract:
% This implementation demonstrates the mechanics of a Bidirectional 
% Associative Memory (BAM) network. It explores the encoding of hetero-
% associative pattern pairs using the correlation matrix method and 
% verifies the stability of the memory through forward and backward recall 
% processes, including the reconstruction of noisy input vectors.
% =========================================================================

clear; clc;

% Definition of bipolar pattern pairs (x1, y1) and (x2, y2)
x1 = [1, 1, 1, 1];
y1 = [1, 1, -1, -1];
x2 = [1, -1, 1, -1];
y2 = [1, -1, -1, 1];

% Definition of a noisy probe vector for recall verification
xt = [1, -1, 1, 1];

% Construction of the Correlation Weight Matrix
% The weight matrix 'w' is synthesized by summing the outer products of 
% the pattern pairs.
x1_t_y1 = x1' * y1;
x2_t_y2 = x2' * y2;
w = x1_t_y1 + x2_t_y2;

% Forward Recall: Verification of Original Patterns
% The activation of input vector x results in the recovery of output y.
fprintf('--- Forward Recall Verification ---\n');
x1_w = x1 * w;
if all(Generalized_Hopfield_Step_Function(x1 * w) == y1)
    fprintf('Pattern Pair 1: Correctly Recalled\n');
end

x2_w = x2 * w;
if all(Generalized_Hopfield_Step_Function(x2 * w) == y2)
    fprintf('Pattern Pair 2: Correctly Recalled\n');
end

% Backward Recall: Verification of Original Patterns
% The activation of output vector y results in the recovery of input x.
fprintf('\n--- Backward Recall Verification ---\n');
y1_wt = y1 * w';
if all(Generalized_Hopfield_Step_Function(y1 * w') == x1)
    fprintf('Pattern Pair 1: Correctly Recalled (Backward)\n');
end

y2_wt = y2 * w';
if all(Generalized_Hopfield_Step_Function(y2 * w') == x2)
    fprintf('Pattern Pair 2: Correctly Recalled (Backward)\n');
end

% Complementary Pattern Recall (Global Stability Check)
% BAM demonstrates stability for the negative (complementary) versions 
% of the stored patterns.
fprintf('\n--- Complementary Pattern Verification ---\n');
if all(Generalized_Hopfield_Step_Function(-x1 * w) == -y1)
    fprintf('Complement 1: Correctly Recalled\n');
end
if all(Generalized_Hopfield_Step_Function(-x2 * w) == -y2)
    fprintf('Complement 2: Correctly Recalled\n');
end

% Noisy Vector Recovery
% The network acts as a content-addressable memory by converging to the 
% nearest stored attractor.
fprintf('\n--- Noisy Vector Recall Analysis ---\n');
yt_retrieved = Generalized_Hopfield_Step_Function(xt * w);
xt_retrieved = Generalized_Hopfield_Step_Function(yt_retrieved * w');

fprintf('Probe Vector: [%s]\n', num2str(xt));
fprintf('Retrieved Output: [%s]\n', num2str(yt_retrieved));
fprintf('Retrieved Input (Attractor): [%s]\n', num2str(xt_retrieved));

% =========================================================================
% Scholarly Insight:
% The Bidirectional Associative Memory (BAM) leverages the stability 
% properties of the energy landscape created by the correlation matrix. 
% It establishes a robust hetero-associative mapping where stored pairs 
% manifest as stable attractors. The network's architectural symmetry 
% ensures that convergence in one direction corresponds to equilibrium in 
% the reverse, facilitating resilient pattern completion and noise 
% suppression in high-dimensional signal processing.
% =========================================================================
