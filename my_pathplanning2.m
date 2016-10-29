function my_pathplanning2(x_init, y_init, x_tgt, y_tgt)
% Our first path planning algorithm really went well. Now we are
% constructing an algorithm based on grid method. How do we do it? Divide a
% size in x-y co ordinated of constant step size. Create a matrix, with
% index placed in center of the square. The area of object is mapped to
% square shape and assigned black holes. 
% Step 1 : We develop a grid from start position and start numbering the
% grid for static posotion. So when we give end position, we are sure how
% to walk to the end position. 
x_room = 10;
y_room = 10;
dxy = 0.1;
l = 1;
nx = x_room/dxy;
ny = y_room/dxy;
room = zeros(nx,ny);
mx = x_init/dxy;
my = y_init/dxy;
room(mx,my) = l;
i_am = [mx;my];
size(i_am,2);
my_neigh = [];
while (find(room == 0))
    l = l+1;
    for i = 1:size(i_am,2)
        if i_am(1,i) > 0 && i_am(2,i) >0 && i_am(1,i) <= nx && i_am(2,i) <= ny
            my_neigh = [my_neigh,i_am(1,i) + 1];
            my_neigh = [my_neigh,i_am(2,i)];
            my_neigh = [my_neigh,i_am(1,i)];
            my_neigh = [my_neigh,i_am(2,i) + 1];
            my_neigh = [my_neigh,i_am(1,i) - 1];
            my_neigh = [my_neigh,i_am(2,i)];
            my_neigh = [my_neigh,i_am(1,i)];
            my_neigh = [my_neigh,i_am(2,i) - 1];
        end
    end
    si = size(my_neigh,2)/2
    my_neigh = reshape(my_neigh,[2,si]);
    for j = 1:size(my_neigh,2)
        if my_neigh(1,j) >0 && my_neigh(2,j) > 0 && my_neigh(1,j) <= nx && my_neigh(2,j) <= ny
            if room(my_neigh(1,j), my_neigh(2,j)) == 0
                room(my_neigh(1,j), my_neigh(2,j)) = l;
            end
        end
    end
    i_am = my_neigh;
    my_neigh = [];
end
figure;
imshow(room);
end

    
        
            
