% =========================================================================
% File Name: Binary_to_Decimal_Conversion.m
% Author: Amey Thakur
% GitHub Profile: https://github.com/Amey-Thakur
% Repository: https://github.com/Amey-Thakur/COMPUTATIONAL-INTELLIGENCE
% Release Date: April 15, 2024
% License: Creative Commons Attribution 4.0 International (CC BY 4.0)
% 
% Description: 
% Utility function for decoding binary representations into their 
% decimal equivalents, supporting fractional precision. This script 
% implements positional notation logic to translate genotypes back into 
% phenotypes within the computational intelligence framework.
% =========================================================================

function decimal_output = Binary_to_Decimal_Conversion(binary_input)
    % Deconstruction of the binary string into integer and fractional components
    parts = strsplit(binary_input, '.');
    
    % Translation of the integer segment via standard base-2 conversion
    decimal_integer = bin2dec(parts{1});
    
    % Iterative decoding of the fractional segment via negative powers of 2
    decimal_fractional = 0;
    if length(parts) > 1
        fractional_bits = parts{2};
        for i = 1:length(fractional_bits)
            if fractional_bits(i) == '1'
                decimal_fractional = decimal_fractional + 2^(-i);
            end
        end
    end
    
    % Recomposition of the final phenotypic value
    decimal_output = decimal_integer + decimal_fractional;
end

% -------------------------------------------------------------------------
% Demonstration of Theoretical Mapping
% -------------------------------------------------------------------------
% Example usage for verifying the conversion of a fractional binary string.
% input_str = '11.11';
% result = Binary_to_Decimal_Conversion(input_str);
% fprintf('Binary input [%%s] translates to Decimal Phenotype [%%.4f]\n', input_str, result);

% -------------------------------------------------------------------------
% Scholarly Insight: Positional Decoding in Evolutionary Search
% -------------------------------------------------------------------------
% The transformation from genotype (binary) to phenotype (decimal) is a 
% fundamental step in evolutionary algorithms. Accurate positional 
% decoding—especially for fractional components—ensures that the 
% fitness landscape is navigated with appropriate granularity. This 
% inverse mapping allows for the precise evaluation of candidate 
% solutions derived from stochastic genetic variations.
