% =========================================================================
% File Name: Fuzzy_Reasoning_System.m
% Author: Amey Thakur
% GitHub Profile: https://github.com/Amey-Thakur
% Repository: https://github.com/Amey-Thakur/COMPUTATIONAL-INTELLIGENCE
% Release Date: April 15, 2024
% License: Creative Commons Attribution 4.0 International (CC BY 4.0)
% 
% Description: 
% Implementation of a fuzzy reasoning system utilizing linear consequent 
% functions. The script evaluates rule-based outputs based on specific 
% input conditions and aggregates the results using the Weighted Average 
% Method. This model demonstrates the transition from linguistic rule 
% firing to crisp numeric output in fuzzy inference architectures.
% =========================================================================

% Precision and environment initialization
format short;
clc;

% -------------------------------------------------------------------------
% 1. Rule Consequent Calculations
% -------------------------------------------------------------------------
% Evaluation of crisp output values (y_i) for individual fuzzy rules.
% Functions are constrained by spatial bounds [0, 10].

y1 = min(10, max(3 * 0.8, 0));
y2 = min(10, max(3 * (1 - 0.7) + 2, 0));
y3 = min(10, max(2 * 0.1 + 5, 0));
y4 = min(10, max(2 * (1 - 0.9) + 8, 0));

% Aggregation of outputs into a numeric vector
ys = [y1, y2, y3, y4];

% -------------------------------------------------------------------------
% 2. Technical Analysis Output
% -------------------------------------------------------------------------
fprintf('\n============================================================\n');
fprintf('           FUZYY REASONING SYSTEM: RULE EVALUATION            \n');
fprintf('============================================================\n');

fprintf('RULE OUTPUTS:\n');
fprintf('• y1 = min(10, max(3 * 0.8, 0))           = %%.4f\n', y1);
fprintf('• y2 = min(10, max(3 * (1 - 0.7) + 2, 0))  = %%.4f\n', y2);
fprintf('• y3 = min(10, max(2 * 0.1 + 5, 0))       = %%.4f\n', y3);
fprintf('• y4 = min(10, max(2 * (1 - 0.9) + 8, 0))  = %%.4f\n', y4);

fprintf('\nSUMMATION LOGIC:\n');
fprintf('• Aggregate Sum of Outputs:                %%.4f\n', sum(ys));

% -------------------------------------------------------------------------
% 3. Defuzzification: Weighted Average Method
% -------------------------------------------------------------------------
% Determination of the final crisp system output (Y) based on rule 
% firing strengths (w).
% Formula: Y = sum(w_i * y_i) / sum(w_i)

w = [0.7, 0.9, 0.4, 0.5]; % Normalized firing strengths per rule

numerator = 0;
for i = 1:length(w)
    numerator = numerator + (w(i) * ys(i));
end

Y = numerator / sum(w);

fprintf('------------------------------------------------------------\n');
fprintf('SYSTEM INFERENCE RESULTS:\n');
fprintf('• Firing Strengths (w):  [%%.1f, %%.1f, %%.1f, %%.1f]\n', w(1), w(2), w(3), w(4));
fprintf('• Final System Output:   Y = %%.4f\n', Y);
fprintf('============================================================\n\n');

% -------------------------------------------------------------------------
% Scholarly Insight: Takagi-Sugeno Inference Efficiency
% -------------------------------------------------------------------------
% The implementation of linear or constant consequents—as seen in 
% Takagi-Sugeno-Kang (TSK) models—significantly reduces the 
% computational burden of defuzzification compared to Mamdani-style 
% centroid methods. By utilizing a weighted average of individual 
% rule outputs, the system achieves a smooth, continuous mapping of 
% the input space while maintaining the interpretability of local 
% linear approximations. This efficiency is paramount for real-time 
% fuzzy control in complex, non-linear dynamical systems.
