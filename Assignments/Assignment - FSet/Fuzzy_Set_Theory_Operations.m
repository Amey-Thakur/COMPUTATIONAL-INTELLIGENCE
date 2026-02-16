% =========================================================================
% Fuzzy_Set_Theory_Operations.m
% =========================================================================
% Author: Amey Thakur
% Release Date: April 15, 2024
% GitHub: https://github.com/Amey-Thakur
% License: Creative Commons Attribution 4.0 International (CC BY 4.0)
% =========================================================================
% Abstract:
% This implementación explores fundamental operations in Fuzzy Set Theory, 
% specifically focusing on the Cartesian product of membership functions. 
% It demonstrates the application of the 'min' T-norm operator to compute 
% the relational strength between elements of two distinct fuzzy sets, 
% forming the basis for fuzzy reasoning and relational mapping.
% =========================================================================

clear; clc;

% Universe of Discourse definitions
X1 = [1, 2, 3];
X2 = [3, 4, 5, 6];

% Membership function values for Fuzzy Sets A1 and A2
A1 = [0.2, 0.5, 0.7];
A2 = [0.2, 0.5, 0.7, 0.2];

% Definition of the target universe Y
Y = [4, 5, 6, 7, 8, 9];

% Computation of the Cartesian Product using the T-norm (min) operator
% The nested iteration calculates the intersection of membership values 
% for all possible element pairings between set A1 and A2.
minm = [];
for i = 1:length(A1)
    for j = 1:length(A2)
        % Application of Zadeh's intersection principle
        minm(end+1) = min(A1(i), A2(j));
    end
end

% Display the resulting relational membership vector
fprintf('--- Fuzzy Relational Membership Vector ---\n');
disp(minm');

% =========================================================================
% Impactful Scholarly Insight:
% The application of T-norm operators such as the 'min' function is 
% pivotal in the construction of fuzzy relations. By evaluating the 
% intersection of membership grades across multiple universes of discourse, 
% we establish a mathematical framework for approximate reasoning. This 
% enables the modeling of complex, non-discrete systems where relational 
% connectivity is expressed as a degree of truth rather than a binary 
% state.
% =========================================================================
