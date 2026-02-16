% =========================================================================
% File Name: Fuzzy_Logic_and_Reasoning.m
% Author: Amey Thakur
% GitHub Profile: https://github.com/Amey-Thakur
% Repository: https://github.com/Amey-Thakur/COMPUTATIONAL-INTELLIGENCE
% Release Date: April 15, 2024
% License: Creative Commons Attribution 4.0 International (CC BY 4.0)
% 
% Description: 
% This script implements a Fuzzy Logic Reasoning module that calculates 
% the geometric properties (Center of Gravity and Area) of various 
% membership functions (Trapezoidal and Triangular). It demonstrates 
% the defuzzification process using the Weighted Average Method to derive 
% a crisp output from multiple fuzzy sets. This is a foundational 
% component of Mamdani-style fuzzy inference systems.
% =========================================================================

% Clear environment and set default precision
format default;
clc;

% -------------------------------------------------------------------------
% 1. Membership Function Definitions (Consequent Sets)
% -------------------------------------------------------------------------

% --- Membership Function 1: Trapezoidal (Left-Heavy) ---
% I've defined this as B1 = [a, b, c, d] = [0, 2, 4, 6]
B1 = [0, 2, 4, 6];
% Here's the theoretical centroid (Center of Gravity for the Trapezoid)
B1_Centroid = (B1(1) + B1(4)) / 2;
% And the geometric area calculation: ((base1 + base2) / 2) * height
B1_Area = ((B1(4)-B1(1)) + (B1(3)-B1(2))) / 2;

% --- Membership Function 2: Triangular ---
% Definition: B2 = [a, b, c] = [4, 6, 8]
B2 = [4, 6, 8];
% Theoretical Centroid for the triangle
B2_Centroid = (B2(1) + B2(3)) / 2; 
% Geometric Area Calculation: (base * height) / 2
B2_Area = (B2(3)-B2(1)) / 2;

% --- Membership Function 3: Trapezoidal (Right-Heavy) ---
% Definition: B3 = [a, b, c, d] = [6, 8, 9.6, 11.6]
B3 = [6, 8, 9.6, 11.6];
% Theoretical Centroid for this second trapezoid
B3_Centroid = (B3(1) + B3(4)) / 2;
% Geometric Area Calculation
B3_Area = ((B3(4)-B3(1)) + (B3(3)-B3(2))) / 2;

% I'm aggregating these properties now for batch processing
areas = [B1_Area B2_Area B3_Area];
centroids = [B1_Centroid B2_Centroid B3_Centroid];

% -------------------------------------------------------------------------
% 2. Theoretical Analysis Output
% -------------------------------------------------------------------------
fprintf('\n============================================================\n');
fprintf('           FUZYY LOGIC REASONING: GEOMETRIC ANALYSIS          \n');
fprintf('============================================================\n');

fprintf('FUNCTION 1: TrapMF (y, [0, 2, 4, 6])\n');
fprintf('• Area:     %%.4f\n', B1_Area);
fprintf('• Centroid: %%.4f\n\n', B1_Centroid);

fprintf('FUNCTION 2: TriMF (y, [4, 6, 8])\n');
fprintf('• Area:     %%.4f\n', B2_Area);
fprintf('• Centroid: %%.4f\n\n', B2_Centroid);

fprintf('FUNCTION 3: TrapMF (y, [6, 8, 9.6, 11.6])\n');
fprintf('• Area:     %%.4f\n', B3_Area);
fprintf('• Centroid: %%.4f\n\n', B3_Centroid);

% -------------------------------------------------------------------------
% 3. Defuzzification: Weighted Average Method
% -------------------------------------------------------------------------
% Now I'm calculating the crisp output (Y) based on firing strengths (w).
% Formula: Y = sum(w * Area * Centroid) / sum(w * Area)

w = [0.3 0.2 0.7]; % These are the degrees of fulfillment I'm using
numerator = 0;
denominator = 0;

for i = 1:length(w)
    numerator = numerator + (w(i) * areas(i) * centroids(i));
    denominator = denominator + (w(i) * areas(i));
end

Y = numerator / denominator;

fprintf('------------------------------------------------------------\n');
fprintf('DEFUZZIFICATION RESULTS (Weighted Average Method):\n');
fprintf('• Weights (w):  [%%.1f, %%.1f, %%.1f]\n', w(1), w(2), w(3));
fprintf('• Crisp Output: Y = %%.4f\n', Y);
fprintf('============================================================\n\n');

% -------------------------------------------------------------------------
% Scholarly Insight: The Geometric Heart of Fuzzy Inference
% -------------------------------------------------------------------------
% Defuzzification isn't just about picking a number; it's about finding 
% the "center of mass" of our collective fuzzy knowledge. In this script, 
% I've used the Weighted Average method because it's computationally 
% elegant while still respecting the individual contributions of each 
% activated fuzzy set. This specific approach is what moves us from 
% abstract linguistic labels to precise, actionable control signals in 
% an industrial fuzzy system.
