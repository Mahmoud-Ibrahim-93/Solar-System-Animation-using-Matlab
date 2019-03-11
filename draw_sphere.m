function [surfHandle,surfX,surfY] = draw_sphere(A,X_Center,Y_Center)
%draw a sphere (in 3D) of a given radius, with its center at the location (X,Y,0).
%In order to draw a sphere, we must use spherical coordinates
% radius A
% X coordinate of the sphere X_Center
% Y coordinate of the sphere Y_Center

Theta=linspace(0,2*pi,30);
Phi=linspace(0,2*pi,30);
grid_points=meshgrid(Theta,Phi);

XGrid=zeros(size(grid_points,1),size(grid_points,2));
YGrid=zeros(size(grid_points,1),size(grid_points,2));
ZGrid=zeros(size(grid_points,1),size(grid_points,2));

% Calculate Grid values from polar Equations
for i=1:size(grid_points,1)
    for j=1:size(grid_points,2)
        XGrid(i,j)= A*cos(i)*sin(j);
        YGrid(i,j)= A*sin(i)*sin(j);
        ZGrid(i,j)= A*cos(j);
    end
end
% add the shift in coordinates
surfX=XGrid+X_Center;
surfY=YGrid+Y_Center;

% get surface handles
surfHandle=surf(surfX,surfY,ZGrid);
end

