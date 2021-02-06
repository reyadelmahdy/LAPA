nx = 100;
ny = 100;
V = zeros(nx,ny);
% Setting max iterations to 1000
iMax = 1000;

% Iterative loop

for n = 1:iMax
    for i = 1 : nx
        for j = 1 : ny
            %Boundaries are fixed to 0 for the top and bottom, and 1 for
            %the right and left sides
            if j == 1  || j == ny
                V(i,j) = 0;
            elseif (i == 1 || i == nx) && (j ~= 1 && j ~= ny)
                V(i,j) = 1;
            else
                V(i,j) = (V(i+1,j) + V(i-1,j) + V(i,j-1) + V(i,j+1))*0.25;
            end
        end
    end
    figure(1)
    if mod(n,100) == 0
        surf(V')
        pause(0.05)
    end
end

% Finding and plotting the E field using the surf and quiver functions
figure(2)
[Ex, Ey] = gradient(V);
subplot(4,1,2)
surf(-Ex,-Ey)

figure(3)
subplot(4,1,3)
quiver(-Ex,-Ey, 10)

% Using imboxfilt(V,3)
figure(4)
subplot(4,1,4)
imshowpair(V,imboxfilt(V,3))