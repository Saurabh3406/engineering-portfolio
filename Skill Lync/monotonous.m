clear
close all
clc

x = [-3 0 7];
l = length(x);
k = 1;

for n=2:l
    diff = x(n) - x(n-1);
    if diff > 0
        k = k+1;
    end
end

if k == l
    fprintf('true')
else
    fprintf('false')
end