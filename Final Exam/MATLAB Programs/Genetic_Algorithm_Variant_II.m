% =========================================================================
% File Name: Genetic_Algorithm_Variant_II.m
% Author: Amey Thakur
% GitHub Profile: https://github.com/Amey-Thakur
% Repository: https://github.com/Amey-Thakur/COMPUTATIONAL-INTELLIGENCE
% Release Date: April 15, 2024
% License: Creative Commons Attribution 4.0 International (CC BY 4.0)
% 
% Description: 
% Exploration of the mutation operator in Genetic Algorithms. This script 
% simulates the stochastic alteration of genotypes at specific bit sites 
% and evaluates the resulting phenotypic shifts. It quantifies the 
% variation in population fitness induced by genetic mutations, 
% underscoring the exploratory nature of evolutionary search.
% =========================================================================

% Environment and precision configuration
format short;
clc;
clear;

% -------------------------------------------------------------------------
% 1. Transitional Population Encoding
% -------------------------------------------------------------------------
% Representation of the population post-crossover before mutation application.

cross_values = [1.00, 2.00, 3.45, 3.80, 5.50, 6.50];
k_indices = 1:length(cross_values);

pre_mut_pop = strings(1, length(cross_values));
for i = 1:length(cross_values)
    bits = fix(rem(cross_values(i) * pow2(-(3-1):4), 2));
    bits_str = string(bits);
    pre_mut_pop(i) = join([join(bits_str(1:3), ""), join(bits_str(4:7), "")], ".");
end

% -------------------------------------------------------------------------
% 2. Mutation Application
% -------------------------------------------------------------------------
% Defined bit positions for point mutations and the resulting genotypes.

mutation_sites = [2, 3, 4, 5, 6, 7];
% Post-mutation genotypic representations
post_mut_gen = ["011.0000", "011.0000", "011.1111", "011.1000", "101.1010", "110.1001"];

% Transformation back to phenotypic space and fitness re-evaluation
mut_phenotypes = [3.00, 3.00, 3.9375, 3.5, 5.625, 6.5625];
mut_fitness = 1 ./ (mut_phenotypes.^2 - 7*mut_phenotypes + 12.25 + 0.001);

% -------------------------------------------------------------------------
% 3. Technical Results Analysis
% -------------------------------------------------------------------------
fprintf('\n============================================================\n');
fprintf('           GENETIC ALGORITHM: MUTATION VARIANT II             \n');
fprintf('============================================================\n');

T = table(k_indices', pre_mut_pop', mutation_sites', post_mut_gen', mut_phenotypes', mut_fitness', ...
    'VariableNames', {'k', 'Pre_Mut_Gen', 'Site', 'Post_Mut_Gen', 'Phenotype', 'Fitness_fxi'});
disp(T);

fprintf('Sum of Mutated Fitness:   %%.4f\n', sum(mut_fitness));
fprintf('Mean Mutated Fitness:    %%.4f\n', mean(mut_fitness));
fprintf('============================================================\n\n');

% -------------------------------------------------------------------------
% Scholarly Insight: Mutation as a Stochastic Gradient Provider
% -------------------------------------------------------------------------
% Point mutations serve as the primary source of diversity in evolutionary 
% trajectories, allowing the search process to escape local basins of 
% attraction. This script highlights how discrete changes in the 
% bit-string genotype can lead to significant phenotypic displacement 
% and fitness variability. In the absence of such stochastic variation, 
% Genetic Algorithms would frequently converge to suboptimal solutions, 
% losing the capacity for innovative structural exploration.
