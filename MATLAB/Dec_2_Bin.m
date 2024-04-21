function binaryFraction = decimalToBinaryFraction(decimalFraction)
    integerPart = floor(decimalFraction);
    fractionalPart = decimalFraction - integerPart;
    binaryInteger = dec2bin(integerPart);
    binaryFraction = '';
    for i = 1:16
        fractionalPart = fractionalPart * 2;
        if fractionalPart >= 1
            binaryFraction = [binaryFraction '1'];
            fractionalPart = fractionalPart - 1;
        else
            binaryFraction = [binaryFraction '0'];
        end
        if fractionalPart == 0
            break;
        end
    end
    binaryFraction = [binaryInteger '.' binaryFraction];
end

% Example usage:
x = 3.75;
y = decimalToBinaryFraction(x);
disp(['Decimal of ', num2str(x), ' is in binary ', y]);
