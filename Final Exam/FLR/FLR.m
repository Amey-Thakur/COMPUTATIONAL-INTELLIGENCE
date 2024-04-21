format default

% Trap
B1 = [0, 2, 4, 6];
B1_Centroid = (B1(1) + B1(4)) / 2;
B1_Area = ((B1(4)-B1(1)) + (B1(3)-B1(2))) / 2;

% Tri
B2 = [4, 6, 8];
B2_Centroid = (B2(1) + B2(3)) / 2;
B2_Area = (B2(3)-B2(1)) / 2;

% Trap
B3 = [6, 8, 9.6, 11.6];
B3_Centroid = (B3(1) + B3(4)) / 2;
B3_Area = ((B3(4)-B3(1)) + (B3(3)-B3(2))) / 2;

areas = [B1_Area B2_Area B3_Area];
centroids = [B1_Centroid B2_Centroid B3_Centroid];

fprintf('TrapMF (y,[0, 2, 4, 6]) \n');
fprintf('Area = %f \n', B1_Area);
fprintf('Centroid = %f \n\n', B1_Centroid);

fprintf('TriMF (y,[4, 6, 8]) \n');
fprintf('Area = %f \n', B2_Area);
fprintf('Centroid = %f \n\n', B2_Centroid);

fprintf('TrapMF (y,[6, 8, 9.6, 11.6]) \n');
fprintf('Area = %f \n', B3_Area);
fprintf('Centroid = %f \n\n', B2_Centroid);

fprintf('sum of centroids = %f \n', B1_Centroid + B2_Centroid + B3_Centroid);

%{
w = [0.3 0.2 0.7];
numerator = 0;
denominator = 0;
for i = 1:length(w)
    numerator = numerator + (w(i)*areas(i)*centroids(i));
    denominator = denominator + (w(i)*areas(i));
end
Y = (numerator) / (denominator);
fprintf('Y = %f \n', Y);
%}
