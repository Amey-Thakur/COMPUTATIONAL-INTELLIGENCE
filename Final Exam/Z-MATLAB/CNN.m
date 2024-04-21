% Input image size
M = 64; N = 64; nC = 3;

% Convolutional layer parameters
nF = 8;     % Number of filters
F1 = 5;     % Filter height
F2 = 5;     % Filter width
D = 4;      % Dilation factor
S = 1;      % Stride
P = 1;      % Padding

% Formula to calculate the number of filter weights per filter
W = F1 * F2 * nC + 1;

% Formula to calculate the total number of filter weights for all filters
nW = (F1 * F2 * nC + 1) * nF;

% Display calculation of filter weights
disp('--------------------------------------------');
disp('           Convolutional Neural Network     ');
disp('--------------------------------------------');
disp(['Input Image Size (M x N x nC): ', num2str(M), ' x ', num2str(N), ' x ', num2str(nC)]);
disp(' ');

disp('Convolutional Layer Parameters:');
disp(['Number of Filters (nF): ', num2str(nF)]);
disp(['Filter Size (F1 x F2): ', num2str(F1), ' x ', num2str(F2)]);
disp(['Dilation Factor (D): ', num2str(D)]);
disp(['Stride (S): ', num2str(S)]);
disp(['Padding (P): ', num2str(P)]);
disp(' ');

disp('Calculation of Filter Weights:');
disp(['The number of filter weights (including one bias) per filter is W = F1 x F2 x nC + 1 = ', num2str(W)]);
disp(['The total number of filter weights for all ', num2str(nF), ' filters is nW = (F1 x F2 x nC + 1) x nF = ', num2str(nW)]);
disp(' ');

% Step 1: Calculate output size
M_out = floor((M + 2*P - D*(F1-1) - 1) / S + 1);
N_out = floor((N + 2*P - D*(F2-1) - 1) / S + 1);

% Display intermediate results for step 1
disp('Step 1: Output size calculation');
disp(['Output Height (M_out): floor((M + 2*P - D*(F1-1) - 1) / S + 1) = ', num2str(M_out)]);
disp(['Output Width (N_out): floor((N + 2*P - D*(F2-1) - 1) / S + 1) = ', num2str(N_out)]);
disp(' ');

% Step 2: Calculate size of each feature map
Mc = M_out; % Height of each feature map
Nc = N_out; % Width of each feature map

% Display size of each feature map
disp('Step 2: Size of each feature map');
disp(['Size of each feature map (Mc x Nc): ', num2str(Mc), ' x ', num2str(Nc), ' = ', num2str(Mc * Nc)]);
disp(' ');

% Step 3: Calculate total number of neurons in the output
total_neurons = Mc * Nc * nF;

% Display intermediate results for step 3 and total number of neurons
disp('Step 3: Total number of neurons calculation');
disp(['Total Number of Neurons in the Output: ', num2str(total_neurons)]);
