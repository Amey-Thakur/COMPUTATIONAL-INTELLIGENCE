format short

y1 = min(10, max(3 * 0.8,0));
y2 = min(10, max(3 * (1 - 0.7) + 2, 0));
y3 = min(10, max(2 * 0.1 + 5, 0));
y4 = min(10, max(2 * (1 - 0.9) + 8, 0));

ys = [y1, y2, y3, y4];

fprintf('y1 = min(10, max(3 * 0.8,0)) = %f \n', y1);
fprintf('y2 = max(3 * (1 - 0.7) + 2, 0) = %f \n', y2);
fprintf('y3 = max(2 * 0.1 + 5, 0) = %f \n', y3);
fprintf('y4 = max(2 * (1 - 0.9) + 8, 0) = %f \n', y4);
fprintf('\nSum of the four outputs = %f \n', y1+y2+y3+y4);

%{
w = [0.7, 0.9, 0.4, 0.5];

numerator = 0;
for i=1:length(w)
    numerator = numerator + w(i)*ys(i);
end
Y = numerator / sum(w);
fprintf('\nY = %f \n', Y)
%}
