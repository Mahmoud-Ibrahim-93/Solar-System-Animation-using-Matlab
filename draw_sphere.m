function [surfHandle,surfX,surfY] = draw_sphere(A,X_Center,Y_Center)
%draw a sphere (in 3D) of a given radius, with its center at the location (X,Y,0).
%In order to draw a sphere, we must use spherical coordinates
% radius A
% X coordinate of the sphere X_Center
% Y coordinate of the sphere Y_Center

% Represents the number of values taken for The Phi values
% Represents half of the values taken for the Theta values
numberOfSweepingPoints=30;

% for polar coordinates
% 0 < Theta < 2*pi
% 0 < Phi < pi
Theta=linspace(0,2*pi,2*numberOfSweepingPoints);
Phi=linspace(0,pi,numberOfSweepingPoints);

% Axis in Cartasian coordinates 
XGrid=zeros(length(Phi),length(Theta));
YGrid=zeros(length(Phi),length(Theta));
ZGrid=zeros(length(Phi),length(Theta));

% Change polar to cartasian Coordinates
for i=1:length(Phi)
    for j=1:length(Theta)
        XGrid(i,j)=A*cos(Theta(j))*sin(Phi(i));
        YGrid(i,j)=A*sin(Theta(j))*sin(Phi(i));
        ZGrid(i,j)=A*cos(Phi(i));
    end
end


% Shift Body Center by distances x , y
surfX=XGrid+X_Center;
surfY=YGrid+Y_Center;

% Draw The surface defined by the points calculated before
surfHandle=surf(surfX,surfY,ZGrid);
end

