% =========================================================================
% Learning_Vector_Quantization.m
% =========================================================================
% Author: Amey Thakur
% Release Date: April 15, 2024
% GitHub: https://github.com/Amey-Thakur
% License: Creative Commons Attribution 4.0 International (CC BY 4.0)
% =========================================================================
% Abstract:
% This implementation demonstrates the Learning Vector Quantization (LVQ1) 
% algorithm, a supervised competitive learning method for pattern 
% classification. It explores the iterative adaptation of weight vectors 
% (codebooks) based on Euclidean distance and class-specific reinforcement 
% signals, enabling the formation of decision boundaries in feature space.
% =========================================================================

clear; clc; format long;

% Input Feature Vectors (Training Population)
X = [1, 0, 0, 0;
     0, 1, 0, 0;
     0, 0, 1, 0;
     0, 0, 0, 1];

% Initial Weight Vectors (Competitive Codebooks)
W1 = [1, 0, 0, 0];
W2 = [0, 0, 1, 0];

% Learning rate parameter (Gamma)
g = 0.5;

% Sample Iteration: Competitive Selection (Winner-Take-All)
% Calculation of squared Euclidean distance between Input X1 and Weights
fprintf('--- Competitive Learning Statistics (Initial State) ---\n');
d1 = sum((X(1,:) - W1).^2);
d2 = sum((X(1,:) - W2).^2);

fprintf('Distance (X1 to W1): %.4f\n', d1);
fprintf('Distance (X1 to W2): %.4f\n', d2);

% Weight Adaptation Logic (LVQ1 Update Rules)
% The winning unit (minimum distance) is updated towards the input if the 
% class matches, and away from the input if the class differs.
fprintf('\n--- Weight Vector Adaptation ---\n');
if d1 < d2
    fprintf('Unit 1 is the Winning Neuron\n');
    W1_updated = LVQ_Update_Step(W1, X(1,:), g, true);
    disp('Updated Weight Vector W1:');
    disp(W1_updated);
else
    fprintf('Unit 2 is the Winning Neuron\n');
    W2_updated = LVQ_Update_Step(W2, X(1,:), g, true);
    disp('Updated Weight Vector W2:');
    disp(W2_updated);
end

% Local Functions for Neuronal Adaptation
function wout = LVQ_Update_Step(W, X, g, class_match)
    % Supervised adaptation based on class alignment
    if class_match
        % Positive reinforcement: Adaptation towards input
        wout = W + g * (X - W);
    else
        % Negative reinforcement: Adaptation away from input
        wout = W - g * (X - W);
    end
end

% =========================================================================
% Scholarly Insight: 
% Learning Vector Quantization represents a fusion of competitive 
% learning and supervised classification. By shifting codebook vectors 
% based on class proximity, LVQ effectively approximates the Bayesian 
% decision boundary. This localized representation of feature space 
% allows the network to partition high-dimensional data into meaningful 
% categories, providing a robust and interpretable framework for 
% non-parametric density estimation and pattern recognition.
% =========================================================================
