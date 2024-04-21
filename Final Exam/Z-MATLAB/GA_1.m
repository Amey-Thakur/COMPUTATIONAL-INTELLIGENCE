% Reproduction Process:

values = [1.00, 2.00, 3.65, 3.60, 5.50, 6.50];

k = 1:length(values);

ini_pop = [];
for i = 1:length(values)
    d2b = string(fix(rem(values(i)*pow2(-(3-1):4),2)));
    dec = join(d2b(1:3), "");
    frac = join(d2b(4:7), "");
    ini_pop(end+1) = join([dec, frac], ".");
end

fitness = [];
for i = 1:length(values)
    fitness(end+1) = 1 / (values(i)^2 - 7*values(i) + 12.25 + 0.001);
end

rwc = [1 1 2 1 1 0];

new_ps = values;
for i = 1:length(rwc)
    if rwc(i) == 0
        new_ps(i) = values(find(rwc==2));
    end 
end

[k' ini_pop' values' fitness' (fitness ./ sum(fitness))' rwc' new_ps']
T = array2table([k' ini_pop' values' fitness' (fitness ./ sum(fitness))' rwc' new_ps'], ...
    "VariableNames", {'k' 'Ini Pop' 'Values (xi)' 'Fitness f(xi)' 'f(xi)/sum(f(xi))' 'RWCs' 'New Parents'})

new_fitness = [];
for i = 1:length(new_ps)
    new_fitness(end+1) = 1 / (new_ps(i)^2 - 7*new_ps(i) + 12.25 + 0.001);
end
fitness_sum = sum(new_fitness)
fitness_avg = sum(new_fitness) / length(new_fitness)