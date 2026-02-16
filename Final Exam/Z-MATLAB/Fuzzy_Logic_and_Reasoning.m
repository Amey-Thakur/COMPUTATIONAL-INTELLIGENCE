% =========================================================================
% File Name: Fuzzy_Logic_and_Reasoning.m
% Author: Amey Thakur
% GitHub Profile: https://github.com/Amey-Thakur
% Repository: https://github.com/Amey-Thakur/COMPUTATIONAL-INTELLIGENCE
% Release Date: April 15, 2024
% License: Creative Commons Attribution 4.0 International (CC BY 4.0)
% 
% Description: 
% Implementation of geometric analysis for fuzzy membership functions 
% (Trapezoidal and Triangular). The script computes centroids and areas 
% for consequent sets and executes defuzzification using the Weighted 
% Average Method to derive crisp control signals.
% =========================================================================

% Precision and environment initialization
format default;
clc;

% -------------------------------------------------------------------------
% 1. Membership Function Definitions (Consequent Sets)
% -------------------------------------------------------------------------

% --- Membership Function 1: Trapezoidal (Left-Heavy) ---
% Definition: B1 = [0, 2, 4, 6]
B1 = [0, 2, 4, 6];
% Theoretical centroid (Center of Gravity) calculation
B1_Centroid = (B1(1) + B1(4)) / 2;
% Geometric area calculation: ((base1 + base2) / 2) * height
B1_Area = ((B1(4)-B1(1)) + (B1(3)-B1(2))) / 2;

% --- Membership Function 2: Triangular ---
% Definition: B2 = [4, 6, 8]
B2 = [4, 6, 8];
% Theoretical centroid for the triangular distribution
B2_Centroid = (B2(1) + B2(3)) / 2; 
% Geometric area calculation: (base * height) / 2
B2_Area = (B2(3)-B2(1)) / 2;

% --- Membership Function 3: Trapezoidal (Right-Heavy) ---
% Definition: B3 = [6, 8, 9.6, 11.6]
B3 = [6, 8, 9.6, 11.6];
% Theoretical centroid calculation for the secondary trapezoid
B3_Centroid = (B3(1) + B3(4)) / 2;
% Geometric area calculation
B3_Area = ((B3(4)-B3(1)) + (B3(3)-B3(2))) / 2;

% Property aggregation for batch processing
areas = [B1_Area B2_Area B3_Area];
centroids = [B1_Centroid B2_Centroid B3_Centroid];

% -------------------------------------------------------------------------
% 2. Geometric Analysis Results
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
% Computation of the crisp output (Y) based on firing strengths (w).
% Formula: Y = sum(w * Area * Centroid) / sum(w * Area)

w = [0.3 0.2 0.7]; % Specific degrees of fulfillment
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
% Scholarly Insight: The Geometric Basis of Defuzzification
% -------------------------------------------------------------------------
% Defuzzification represents the critical translation of abstract fuzzy 
% inference into a definitive, actionable control signal. The Weighted 
% Average method provides a computationally efficient approximation of 
% the Center of Gravity, successfully balancing the individual firing 
% strengths of multiple activated fuzzy sets. This deterministic 
% mapping forms the technical bridge between linguistic reasoning and 
% precise industrial automation.
