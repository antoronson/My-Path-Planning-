function[value,index] =  minimum_array(arr)
x = arr;
value = max(x);

for i = 1:size(x)
    if value == x(i)
        index = i;
    end
end
return;
% This is my first code
end
