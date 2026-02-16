% =========================================================================
% Genetic_Algorithm_Implementation.m
% =========================================================================
% Author: Amey Thakur
% Release Date: April 15, 2024
% GitHub: https://github.com/Amey-Thakur
% License: Creative Commons Attribution 4.0 International (CC BY 4.0)
% =========================================================================
% Abstract:
% This implementation explores the fitness evaluation component of a 
% Genetic Algorithm (GA). It demonstrates the process of objective 
% function mapping, fitness summation, and normalization (relative 
% selection probability) for various phenotypic populations. The script 
% analyzes how different parameterizations of the objective function 
% influence the selection pressure within an evolutionary cycle.
% =========================================================================

clear; clc;

% Initial Population Phenotypes (Population Set 1)
% Note: This block serves as a reference for baseline fitness scaling.
pop_ref = [1.00, 2.00, 3.65, 3.60, 5.50, 6.50];

% Target Population Phenotypes (Population Set 3)
pop_target = [3.0000, 3.0000, 3.9375, 3.5000, 5.6250, 6.5625];

% Fitness Evaluation Logic
% The fitness is derived from a minimization objective function:
% f(x) = x^2 - 7x + 12.25
% To convert this to a maximization problem suitable for selection, 
% the reciprocal is used with a small epsilon (1e-3) for numerical stability.

% Initialize fitness vector
fitness = zeros(length(pop_target), 1);

for i = 1:length(pop_target)
    % Compute individual fitness scores
    fitness(i) = 1 / (pop_target(i)^2 - 7*pop_target(i) + 12.25 + 0.001);
end

% Aggregate Statistical Analysis
fitness_sum = sum(fitness);
fitness_avg = fitness_sum / length(pop_target);

% Relative Fitness (Selection Probabilities)
% The normalized fitness represents the individual's contribution to the 
% total fitness of the population, determining its proportional chance of 
% reproduction.
normalized_fitness = fitness ./ fitness_sum;

% Terminal Output Generation
fprintf('--- Genetic Algorithm Fitness Analysis ---\n');
fprintf('Population Size: %d\n', length(pop_target));
fprintf('Total Population Fitness: %.4f\n', fitness_sum);
fprintf('Average Individual Fitness: %.4f\n', fitness_avg);
fprintf('\nIndividual Proportional Probabilities:\n');
disp(normalized_fitness);

% =========================================================================
% Scholarly Insight: 
% The transformation of an objective function into a fitness landscape is 
% a critical design decision in evolutionary computation. By utilizing the 
% reciprocal of the error function, we establish a probabilistic mapping 
% where individuals closer to the optimum exert greater influence on the 
% genetic pool of the subsequent generation. The selection pressure 
% relative to the population average determines the balance between 
% exploration and exploitation during the stochastic search process.
% =========================================================================
