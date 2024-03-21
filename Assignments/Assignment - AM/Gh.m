function x = Gh(a)
    x = zeros(1, length(a));
    for index = 1:length(a)
        if a(index) >= 0
            x(index) = 1;
        else
            x(index) = -1;
        end
    end
end
