function decimalFraction = binaryToDecimalFraction(binaryFraction)
    parts = strsplit(binaryFraction, '.');
    decimalInteger = bin2dec(parts{1});
    decimalFractional = 0;
    for i = 1:length(parts{2})
        if parts{2}(i) == '1'
            decimalFractional = decimalFractional + 2^(-i);
        end
    end
    decimalFraction = decimalInteger + decimalFractional;
end

% Example usage:
y = '11.11';
x = binaryToDecimalFraction(y);
disp(['Binary ', y, ' is in decimal ', num2str(x)]);