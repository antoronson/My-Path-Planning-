function[x,y] =  my_pathplanning1(x_init, y_init, x_fin, y_fin)
% Room Size(m)
x_min = 0.0;
x_max = 10.0;
y_min = 0.0;
y_max = 10.0;
x = [];
y = [];
if x_init < x_min || x_init > x_max || y_init < y_min || y_init > y_max
    msg = ' Initial Position Value out of boundary';
    error(msg);
end
if x_fin < x_min || x_fin > x_max || y_fin < y_min || y_fin > y_max
    msg = ' Final Position Value out of boundary';
    error(msg);
end
theta = [0:1:360];
r = [0.01:0.01:1];

% I am Calculting position for next step by constructing a circle of radius
% r. 
% When a full circle is formed without collision, I increse the size from
% 0.1 to 1.
% Position calculated [theta;x;y];
my_pos = zeros(3,360);
my_pos(1,:) = [1:1:360];
x_pos = x_init;
y_pos = y_init;
while x_pos ~= x_max && y_pos ~= y_max
    n = size(r);
    r_dist = [];
    for i = 1:n
        for j = 1:size(my_pos,2)
            my_pos(2,j) = r(i) * cosd(my_pos(1,j));
            my_pos(3,j) = r(i) * sind(my_pos(1,j));
        end
        x_index = x_pos + my_pos(2,:);
        y_index = y_pos + my_pos(3,:);
        dist = sqrt(power((x_pos - x_index),2) + power((y_pos - y_index),2));
        [value, index] = min(dist);
        if value == 0 
            break;
        else
            x_pos_inter = x_index(index);
            y_pos_inter = y_index(index);
        end
        r_dist = [r_dist,value];
    end
    x = [x,x_pos];
    y = [y,y_pos];
    x_pos = x_pos_inter;
    y_pos = y_pos_inter;
    if x_pos > x_fin && y_pos > y_fin
        break;
    end
    
end
x = [x,x_fin];
y = [y,y_fin];
plot(x,y,'*');
axis([0 10 0 10]);
end

    