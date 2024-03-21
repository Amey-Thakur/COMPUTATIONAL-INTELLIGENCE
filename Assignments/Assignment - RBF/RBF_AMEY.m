format long;

% Define the matrixH
a=([1 1 0.367879; 1 0.444858 0.163654; 1 0.367879 1; 1 0.163654 0.444858])
D=[1 0 0 0]

%Transpose the matrix
b=a'
c=b*a
d=inv(c)
Hplus=d*b
w=Hplus*D'
sum(w)