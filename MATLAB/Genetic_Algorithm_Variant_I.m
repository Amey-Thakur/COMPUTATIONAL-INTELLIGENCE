% =========================================================================
% File Name: Genetic_Algorithm_Variant_I.m
% Author: Amey Thakur
% GitHub Profile: https://github.com/Amey-Thakur
% Repository: https://github.com/Amey-Thakur/COMPUTATIONAL-INTELLIGENCE
% Release Date: April 15, 2024
% License: Creative Commons Attribution 4.0 International (CC BY 4.0)
% 
% Description: 
% Simulation of the reproduction phase in a Genetic Algorithm. This 
% script demonstrates the selection of new parents from an initial 
% population based on relative fitness and stochastic sampling. 
% It provides a detailed breakdown of genotypic encoding and 
% phenotypic evaluation within an evolutionary framework.
% =========================================================================

% Environment and precision configuration
format short;
clc;
clear;

% -------------------------------------------------------------------------
% 1. Population Initialization and Encoding
% -------------------------------------------------------------------------
% Definition of initial phenotypic values and conversion to 7-bit binary 
% genotypes (3-bit integer, 4-bit fraction).

values = [1.00, 2.00, 3.65, 3.60, 5.50, 6.50];
k_index = 1:length(values);

ini_pop = strings(1, length(values));
for i = 1:length(values)
    % Successive division/remainder logic for binary representation
    bits = fix(rem(values(i) * pow2(-(3-1):4), 2));
    bits_str = string(bits);
    ini_pop(i) = join([join(bits_str(1:3), ""), join(bits_str(4:7), "")], ".");
end

% -------------------------------------------------------------------------
% 2. Fitness Evaluation and Selection
% -------------------------------------------------------------------------
% Computing survival probability based on objective function maximization.
% f(x) = 1 / (x^2 - 7x + 12.25 + 0.001)

fitness = 1 ./ (values.^2 - 7*values + 12.25 + 0.001);
relative_fitness = fitness ./ sum(fitness);

% Specific reproduction counts based on fitness distribution
rwc = [1, 1, 2, 1, 1, 0];

% Selection of the next generation of parents
new_ps = values;
for i = 1:length(rwc)
    if rwc(i) == 0
        % Replacing low-fitness individuals with multiple offspring of dominant parents
        new_ps(i) = values(find(rwc == 2, 1));
    end 
end

% -------------------------------------------------------------------------
% 3. Technical Results Analysis
% -------------------------------------------------------------------------
fprintf('\n============================================================\n');
fprintf('           GENETIC ALGORITHM: REPRODUCTION VARIANT I          \n');
fprintf('============================================================\n');

T = table(k_index', ini_pop', values', fitness', relative_fitness', rwc', new_ps', ...
    'VariableNames', {'k', 'Genotype', 'Phenotype', 'Fitness_fxi', 'Rel_Fit', 'RWC_Count', 'Next_Gen_Parents'});
disp(T);

fprintf('Mean Population Fitness: %%.4f\n', mean(fitness));
fprintf('============================================================\n\n');

% -------------------------------------------------------------------------
% Scholarly Insight: Fitness-Proportional Selection Pressure
% -------------------------------------------------------------------------
% In evolutionary computation, the reproduction phase establishes the 
% selection pressure required to guide the population toward higher-fitness 
% regions of the search space. By implementing an inverse objective 
% function, the system effectively optimizes for local minima, 
% demonstrating how relative fitness can be utilized to amplify superior 
% genetic traits across successive generations.
