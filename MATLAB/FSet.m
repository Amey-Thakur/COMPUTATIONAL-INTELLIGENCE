%{
% one-to-one mapping:
X1 = -3:3;
ux1 = [0.5 0.7 0.9 1 0.8 0.4 0.2];

k = 1:length(X1);

y = [];
for i = 1:length(X1)
    y(end+1) = X1(i)^2 - 5;
end

ub = [];
for i = 1:length(y)
    uxs = [];
    for j = 1:length(ux1)
        if y(i) == y(j)
            uxs(end+1) = ux1(j);
        end
    end
    ub(i) = max(uxs);
end

T = array2table([k' X1' ux1' y' ub'], ...
    "VariableNames", {'k' 'x1' 'ux1' 'y' 'ub'})

b = dictionary(y, ub);

output = 'B = ';

keys = b.keys;
values = b.values;

for i = 1:numel(keys)
    output = [output sprintf('%.1f | %d', values(i), keys(i))];
    
    if i < numel(keys)
        output = [output ' + '];
    end

end

disp(output);
sum = sum(b.values())
%}

%{ %}
% two-to-one mapping:
X1 = [1, 2, 3];
X2 = [3, 4, 5, 6];

A1 = [0.2, 0.5, 0.9];
A2 = [0.2, 0.5, 0.9, 0.2];

k = 1:length(X1)*length(X2);

x1 = [];
a1 = [];
for i = 1:length(X1)
    for j = 1:length(X2)
        x1(end+1) = X1(i);
        a1(end+1) = A1(i);
    end
end

x2 = [];
a2 = [];
for i = 1:length(X1)
    for j = 1:length(X2)
        x2(end+1) = X2(j);
        a2(end+1) = A2(j);
    end
end

y = [];
for i = 1:length(X1)
    for j = 1:length(X2)
        y(end+1) = X1(i) + X2(j);
    end
end

minm = [];
for i = 1:length(A1)
    for j = 1:length(A2)
        minm(end+1) = min(A1(i), A2(j));
    end
end

ub = [];
for i = 1:length(y)
    mins = [];
    for j = 1:length(minm)
        if y(i) == y(j)
            mins(end+1) = minm(j);
        end
    end
    ub(i) = max(mins);
end

T = array2table([k' x1' a1' x2' a2' y' minm' ub'], ...
    "VariableNames", {'k' 'x1' 'ux1' 'x2' 'ux2' 'y' 'min(ux1, ux2)' 'ub'})

b = dictionary(y, ub);

output = 'B = ';

keys = b.keys;
values = b.values;

for i = 1:numel(keys)
    output = [output sprintf('%.1f | %d', values(i), keys(i))];
    
    if i < numel(keys)
        output = [output ' + '];
    end

end

disp(output);
sum = sum(b.values())
