% =========================================================================
% File Name: Fuzzy_Set_Theory.m
% Author: Amey Thakur
% GitHub Profile: https://github.com/Amey-Thakur
% Repository: https://github.com/Amey-Thakur/COMPUTATIONAL-INTELLIGENCE
% Release Date: April 15, 2024
% License: Creative Commons Attribution 4.0 International (CC BY 4.0)
% 
% Description: 
% This script explores and implements the Zadeh's Extension Principle, 
% a fundamental concept in fuzzy set theory used to extend classical 
% mathematical operations to fuzzy domains. It covers both one-to-one 
% and two-to-one mappings, demonstrating how membership functions are 
% transformed through algebraic functions while maintaining fuzzy 
% uncertainty propagation.
% =========================================================================

% Clear environment
clc;
clear;

% -------------------------------------------------------------------------
% 1. One-to-One Mapping Analysis
% -------------------------------------------------------------------------
% Mapping a fuzzy set through a single-variable function: f(x) = x^2 - 5

fprintf('============================================================\n');
fprintf('           FUZZY SET THEORY: ONE-TO-ONE MAPPING               \n');
fprintf('============================================================\n');

% Define the universe of discourse X1 and its corresponding membership grades ux1
X1 = -3:3;
ux1 = [0.5 0.7 0.9 1 0.8 0.4 0.2];

k = 1:length(X1);
y = X1.^2 - 5; % Transform inputs through the target function

% Apply Extension Principle (max-membership) for overlapping output values
ub_single = [];
unique_y = unique(y);

for i = 1:length(unique_y)
    % Find all indices in y that match the current unique output
    match_indices = find(y == unique_y(i));
    % Assign the maximum membership value among all mapping inputs
    ub_single(i) = max(ux1(match_indices));
end

% Display the mapping transformation in a structured table
T1 = table(k', X1', ux1', y', 'VariableNames', {'k', 'x', 'mu_x', 'y_output'});
disp('Mapping Transformation Table (Step-by-Step):');
disp(T1);

% Construct a dictionary for unique results to represent the final Fuzzy Set B
b_dict_single = dictionary(unique_y, ub_single);

% Display the result in Fuzzy Set Notation: mu/y + mu/y ...
output_str = 'Resultant Fuzzy Set B = ';
keys_s = b_dict_single.keys;
vals_s = b_dict_single.values;

for i = 1:numel(keys_s)
    output_str = [output_str sprintf('%.1f/%.1f', vals_s(i), keys_s(i))];
    if i < numel(keys_s)
        output_str = [output_str ' + '];
    end
end

fprintf('\nFinal Resultant Fuzzy Set (Notation Form):\n');
fprintf('%%s\n', output_str);
fprintf('Total Sigma-Count (Sum of Memberships): %%.2f\n', sum(vals_s));
fprintf('------------------------------------------------------------\n\n');

% -------------------------------------------------------------------------
% 2. Two-to-One Mapping Analysis
% -------------------------------------------------------------------------
% Mapping two fuzzy sets through a multi-variable function: f(x1, x2) = x1 + x2

fprintf('============================================================\n');
fprintf('           FUZZY SET THEORY: TWO-TO-ONE MAPPING               \n');
fprintf('============================================================\n');

% Define input universes and their respective membership functions
X1_in = [1, 2, 3];
X2_in = [3, 4, 5, 6];

A1_mu = [0.2, 0.5, 0.9];
A2_mu = [0.2, 0.5, 0.9, 0.2];

% Initialize variables for combinatorial mapping
count = 1;
x1_grid = []; a1_mu_grid = [];
x2_grid = []; a2_mu_grid = [];
y_combined = [];
min_memberships = [];

% Compute Cartesian product for all possible combinations of (x1, x2)
for i = 1:length(X1_in)
    for j = 1:length(X2_in)
        x1_grid(count) = X1_in(i);
        a1_mu_grid(count) = A1_mu(i);
        x2_grid(count) = X2_in(j);
        a2_mu_grid(count) = A2_mu(j);
        
        % Calculate output value: y = x1 + x2
        y_combined(count) = X1_in(i) + X2_in(j);
        
        % Apply the 'min' operator for T-norm intersection (Mamdani style)
        min_memberships(count) = min(A1_mu(i), A2_mu(j));
        count = count + 1;
    end
end

% Apply the Extension Principle: B(y) = sup [ min(A1(x1), A2(x2)) ] s.t. y = x1 + x2
unique_y_comb = unique(y_combined);
ub_mult = [];

for i = 1:length(unique_y_comb)
    indices = find(y_combined == unique_y_comb(i));
    ub_mult(i) = max(min_memberships(indices));
end

% Construct consolidated table for scholarly documentation
k_mult = 1:length(y_combined);
T2 = table(k_mult', x1_grid', a1_mu_grid', x2_grid', a2_mu_grid', y_combined', min_memberships', ...
    'VariableNames', {'k', 'x1', 'mu_x1', 'x2', 'mu_x2', 'y', 'min_mu'});
disp('Multivariate Mapping Combinations:');
disp(T2);

% Representation of the final resulting Fuzzy Set B
b_dict_mult = dictionary(unique_y_comb, ub_mult);

output_mult = 'Resultant Fuzzy Set B = ';
keys_m = b_dict_mult.keys;
vals_m = b_dict_mult.values;

for i = 1:numel(keys_m)
    output_mult = [output_mult sprintf('%.1f/%.1f', vals_m(i), keys_m(i))];
    if i < numel(keys_m)
        output_mult = [output_mult ' + '];
    end
end

fprintf('\nFinal Consolidated Fuzzy Set (Notation Form):\n');
fprintf('%%s\n', output_mult);
fprintf('Total Sigma-Count: %%.2f\n', sum(vals_m));
fprintf('============================================================\n');

% -------------------------------------------------------------------------
% Scholarly Insight
% -------------------------------------------------------------------------
% The Extension Principle is more than just a calculation tool; it's what 
% allows fuzzy systems to interact with the real, crisp world. When we 
% map multiple points to the same output, the 'max' operator ensures we 
% preserve the most optimistic possibility of that outcome. This logic 
% forms the backbone of how fuzzy controllers compute their intermediate 
% decision surfaces before defuzzification.
