%{
pop1 = [1.00, 2.00, 3.65, 3.60, 5.50, 6.50];

fitness = [];
for i = 1:length(pop1)
    fitness(end+1) = 1 / (pop1(i)^2 - 7*pop1(i) + 12.25 + 0.001);
end

fitness = fitness'
fitness_sum = sum(fitness)
fitness_avg = sum(fitness) / length(fitness)
normalized_fitness = fitness ./ sum(fitness)
%}

% pop2 = [1.00, 2.00, 3.45, 3.80, 5.50, 6.50];
% crossover = [2, 3, 4, 5, 6, 7];
format default

pop3 = [3.0000, 3.0000, 3.9375, 3.5000, 5.6250, 6.5625];

fitness = [];
for i = 1:length(pop3)
    fitness(end+1) = 1 / (pop3(i)^2 - 7*pop3(i) + 12.25 + 0.001);
end

fitness = fitness'
fitness_sum = sum(fitness)
fitness_avg = sum(fitness) / length(fitness)
fitness_by_avg = fitness ./ sum(fitness)
