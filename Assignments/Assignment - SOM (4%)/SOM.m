format long;
n = 11;
A = 0.1;
S = 10;
alpha = 7;
a = 2;
M = 2*a + 1;
b = 0.06;
c = -0.04;


k_0 = char_f(I_j(A, n), S);

format short;
k_0 = round(k_0, 2)


k_1 = SOM(k_0, a, b, c, M, S)

k_2 = SOM(k_1, a, b, c, M, S);

k_3 = SOM(k_2, a, b, c, M, S);

% formula 6.2.7
function out = SOM(y_k, a, b, c, M, S)
    % total neuron number
    total_neuron = 2*M + 1;
    % excitation range
    left_a = (M+1)-a;
    right_a = (M+1)+a;

    f_j = zeros(1, total_neuron);
    % assign f_mj
    for ind = 1:total_neuron
        if ind < left_a || ind > right_a
            f_j(ind) = c;
        else
            f_j(ind) = b;
        end
    end

    % for each j value, we have different feedback factors
    for j = 1:total_neuron
        o = 7*sum(f_j.*circularzeropadding(y_k, (M+1)-j));
        out(j) = char_f(o, S);
    end
end

function out = circularzeropadding(input, shiftx)
    out = circshift(input, shiftx);
    if shiftx < 0
        out(:, (end+shiftx):end) = 0;
    else
        out(:, (1:shiftx)) = 0;
    end
end

function out = I_j(A, N)
    for j = 0:N-1
        ind = j+1;
        out(ind) = A*(sin((j*pi)/(N-1)))^2;
    end
end

function out = char_f(z, S)
    out = max(min(z, S), 0);
end
