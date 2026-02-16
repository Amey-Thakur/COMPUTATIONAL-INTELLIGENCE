% =========================================================================
% File Name: Decimal_to_Binary_Conversion.m
% Author: Amey Thakur
% GitHub Profile: https://github.com/Amey-Thakur
% Repository: https://github.com/Amey-Thakur/COMPUTATIONAL-INTELLIGENCE
% Release Date: April 15, 2024
% License: Creative Commons Attribution 4.0 International (CC BY 4.0)
% 
% Description: 
% Utility function for encoding decimal phenotypes into binary genotypes, 
% incorporating fractional precision. The script utilizes the successive 
% multiplication method for fractional binary conversion, facilitating 
% the discretization of continuous variables for evolutionary processing.
% =========================================================================

function binary_output = Decimal_to_Binary_Conversion(decimal_input)
    % Separation of the phenotypic value into integer and fractional parts
    integer_part = floor(decimal_input);
    fractional_remainder = decimal_input - integer_part;
    
    % Encoding of the integer component
    binary_integer = dec2bin(integer_part);
    
    % Successive multiplication method for fractional binary encoding
    % Constrained to 16-bit precision for computational efficiency
    binary_fractional = '';
    for i = 1:16
        fractional_remainder = fractional_remainder * 2;
        if fractional_remainder >= 1
            binary_fractional = [binary_fractional '1'];
            fractional_remainder = fractional_remainder - 1;
        else
            binary_fractional = [binary_fractional '0'];
        end
        if fractional_remainder == 0
            break;
        end
    end
    
    % Assembly of the final genotypic string
    binary_output = [binary_integer '.' binary_fractional];
end

% -------------------------------------------------------------------------
% Demonstration of Theoretical Encoding
% -------------------------------------------------------------------------
% Example usage for verifying the discretization of a continuous value.
% input_val = 3.75;
% result_str = Decimal_to_Binary_Conversion(input_val);
% fprintf('Decimal input [%%.4f] encodes to Binary Genotype [%%s]\n', input_val, result_str);

% -------------------------------------------------------------------------
% Scholarly Insight: Discretization and Genetic Resolution
% -------------------------------------------------------------------------
% Converting continuous phenotypes into binary genotypes (discretization) 
% implicitly defines the resolution of the genetic search. The bit-depth 
% of the fractional representation determines the granularity of the 
% fitness landscape's traversal. High-fidelity encoding is essential 
% for ensuring that infinitesimal improvements in the objective function 
% can be captured and propagated through successive generations.
