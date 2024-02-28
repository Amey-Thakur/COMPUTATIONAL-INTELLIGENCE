format long
X_1 = [1 0 0 0];
X_2 = [0 1 0 0];
X_3 = [0 0 1 0];
X_4 = [0 0 0 1];

W_1 = [1 0 0 0];
W_2 = [0 0 1 0];

g = 0.5;


sum((X_1 - W_1).^2)
sum((X_1 - W_2).^2)


same_class(W_1, X_1, g)

function wout = same_class(W, X, g)
    wout = W + g*(X - W);
end


function wout = diff_class(W, X, g)
    wout = W - g*(X - W);
end