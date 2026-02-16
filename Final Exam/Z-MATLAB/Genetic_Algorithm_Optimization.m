% =========================================================================
% File Name: Genetic_Algorithm_Optimization.m
% Author: Amey Thakur
% GitHub Profile: https://github.com/Amey-Thakur
% Repository: https://github.com/Amey-Thakur/COMPUTATIONAL-INTELLIGENCE
% Release Date: April 15, 2024
% License: Creative Commons Attribution 4.0 International (CC BY 4.0)
% 
% Description: 
% Implementation of the fundamental operators in a Genetic Algorithm (GA), 
% specifically reproduction (selection) and mutation. The script 
% demonstrates the transformation of decimal phenotypes to binary 
% genotypes, fitness evaluation based on objective functions, and the 
% stochastic variation induced by point mutations. This serves as a 
% comprehensive simulation of evolutionary search and optimization.
% =========================================================================

% Precision and environment initialization
format short;
clc;
clear;

% -------------------------------------------------------------------------
% 1. Selection and Reproduction Process
% -------------------------------------------------------------------------
% Evaluation of the initial population and selection of new parents based 
% on fitness-proportional logic.

% Phenotypic values of the initial population
values = [1.00, 2.00, 3.65, 3.60, 5.50, 6.50];
k_rep = 1:length(values);

% Genotypic representation (Binary encoding: 3-bit integer, 4-bit fraction)
ini_pop = strings(1, length(values));
for i = 1:length(values)
    % Binary conversion logic via remainder-power transformation
    d2b_bits = fix(rem(values(i) * pow2(-(3-1):4), 2));
    bits_str = string(d2b_bits);
    dec_part = join(bits_str(1:3), "");
    frac_part = join(bits_str(4:7), "");
    ini_pop(i) = join([dec_part, frac_part], ".");
end

% Fitness evaluation: f(x) = 1 / (x^2 - 7x + 12.25 + 0.001)
fitness = 1 ./ (values.^2 - 7*values + 12.25 + 0.001);
relative_fitness = fitness ./ sum(fitness);

% Simulated Roulette Wheel selection counts
rwc = [1, 1, 2, 1, 1, 0];

% Parent selection based on RWC counts
new_ps = values;
for i = 1:length(rwc)
    if rwc(i) == 0
        % Replace eliminated individuals with dominant survivors
        dominant_idx = find(rwc == 2, 1);
        new_ps(i) = values(dominant_idx);
    end 
end

% Output generation for the reproduction phase
fprintf('\n============================================================\n');
fprintf('           GENETIC ALGORITHM: REPRODUCTION PHASE            \n');
fprintf('============================================================\n');

T1 = table(k_rep', ini_pop', values', fitness', relative_fitness', rwc', new_ps', ...
    'VariableNames', {'k', 'Genotype', 'Phenotype_xi', 'Fitness_fxi', 'Relative_Fit', 'RWC', 'New_Parents'});
disp(T1);

fprintf('Genetic Statistics (Post-Reproduction):\n');
fprintf('• Cumulative Fitness Sum: %%.4f\n', sum(fitness));
fprintf('• Mean Population Fitness: %%.4f\n\n', mean(fitness));

% -------------------------------------------------------------------------
% 2. Variation Process (Mutation)
% -------------------------------------------------------------------------
% Simulation of the mutation operator acting on a converged population.

% Crossover/transitional population values
cross_values = [1.00, 2.00, 3.45, 3.80, 5.50, 6.50];
k_mut = 1:length(cross_values);

% Re-encoding transitional population to binary genotype
pop_bin = strings(1, length(cross_values));
for i = 1:length(cross_values)
    d2b_bits = fix(rem(cross_values(i) * pow2(-(3-1):4), 2));
    bits_str = string(d2b_bits);
    dec_part = join(bits_str(1:3), "");
    frac_part = join(bits_str(4:7), "");
    pop_bin(i) = join([dec_part, frac_part], ".");
end

% Defined mutation sites and resulting mutated genotypes
sites = [2, 3, 4, 5, 6, 7];
% Note: mut_pop represents the decimal-formatted binary string after mutation
mut_pop_str = ["011.0000", "011.0000", "011.1111", "011.1000", "101.1010", "110.1001"];

% Mutated phenotypic values and corresponding fitness
mut_values = [3.00, 3.00, 3.9375, 3.5, 5.625, 6.5625];
mut_fitness = 1 ./ (mut_values.^2 - 7*mut_values + 12.25 + 0.001);

% Output generation for the mutation phase
fprintf('============================================================\n');
fprintf('           GENETIC ALGORITHM: MUTATION PHASE               \n');
fprintf('============================================================\n');

T2 = table(k_mut', pop_bin', sites', mut_pop_str', mut_values', mut_fitness', ...
    'VariableNames', {'k', 'Pre_Mut_Gen', 'Site', 'Post_Mut_Gen', 'Phenotype_xi', 'Fitness_fxi'});
disp(T2);

fprintf('Genetic Statistics (Post-Mutation):\n');
fprintf('• Mutated Fitness Sum:    %%.4f\n', sum(mut_fitness));
fprintf('• Mutated Mean Fitness:   %%.4f\n', mean(mut_fitness));
fprintf('============================================================\n\n');

% -------------------------------------------------------------------------
% Scholarly Insight: The Exploratory Power of Genetic Variation
% -------------------------------------------------------------------------
% While selection and reproduction (recombination) consolidate high-fitness 
% traits within a population, the mutation operator provides the 
% essential mechanism for global exploration of the search space. By 
% stochastically altering genotypes, mutation prevents premature 
% convergence on local optima, ensuring the evolutionary process 
% maintains the genetic diversity required for navigating complex, 
% non-convex biological and computational fitness landscapes.
