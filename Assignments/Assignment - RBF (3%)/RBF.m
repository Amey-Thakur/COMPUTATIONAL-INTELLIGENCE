
X1=[1 0 0];
X2=[0 1 0];
X3=[0 0 1];

T1=[1 0 0];
T2=[0 0 1];

D=[1 0 -1];

% g11 = exp(-(X1-T1)*(X1-T1)')
g11 = exp(-sum((X1 - T1).^2));
g12 = exp(-sum((X1 - T2).^2));
g21 = exp(-sum((X2 - T1).^2));
g22 = exp(-sum((X2 - T2).^2));
g31 = exp(-sum((X3 - T1).^2));
g32 = exp(-sum((X3 - T2).^2));


fprintf('g11 = %.6f\n', g11);
fprintf('g12 = %.6f\n', g12);
fprintf('g21 = %.6f\n', g21);
fprintf('g22 = %.6f\n', g22);
fprintf('g31 = %.6f\n', g31);
fprintf('g32 = %.6f\n', g32);


G=[g11 g12;g21 g22;g31 g32]

H = [ones(3,1), G];






disp('H matrix:');
disp(H);

H_pseudo = pinv(H);

disp('Pseudo-inverse of H:');
disp(H_pseudo);

W_c = H_pseudo * D';

sum_weights = sum(W_c);

disp('Combined Weight Vector W_c:');
disp(W_c');
fprintf('Sum of the weight values: %.4f\n', sum_weights);
