X1 = [1, 2, 3];
X2 = [3, 4, 5, 6];

A1 = [0.2, 0.5, 0.7];
A2 = [0.2, 0.5, 0.7, 0.2];

Y = [4, 5, 6, 7, 8, 9];

B = [];
minm = [];
for i = 1:length(A1)
    for j = 1:length(A2)
        minm(end+1) = min(A1(i), A2(j));
    end
end

minm'