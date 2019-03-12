function  animateOrbit(star_radius,planets_radii,major_axes,minor_axes)
% Eg animateOrbit(200,25,1000,750)
NumberOfOrbits=100;
TimeSteps=250;
%animates the orbit given the two radii (R1 and R2), and the semimajor and semiminor axes.
%Radius of the stationary body R1
%Radius of the orbiting body R2
%Semimajor axis A
%Semiminor axis B

%set default value for semi-minor axis B in case being missing
 if ~exist('minor_axes','var')
     % if B (Semiminor axis) doesn't exist then make it equal 
     % to A (Semimajor axis)
      minor_axes=major_axes;
 end
% Validate that Collision doesn't occur
C=sqrt(major_axes^2-minor_axes^2);
if (C+star_radius)> (major_axes-planets_radii)
  error('Collision imminent!');
end

% Validate that the inputs are numeric
if ~isnumeric(star_radius) || ~isnumeric(planets_radii) || ~isnumeric(major_axes) || ~isnumeric(minor_axes) 
  error('Inputs must be numeric!');
end

% Validate that the inputs are scalar
if ~isscalar(star_radius) || ~isscalar(planets_radii) || ~isscalar(major_axes) || ~isscalar(minor_axes) 
  error('Inputs must be scalar!');
end

% Validate that the input are positive
if star_radius<=0 || planets_radii<=0 || major_axes<=0 || minor_axes<=0
  error('All input values should be positive');
end

% Validate Semimajor axis must be greater than semiminor axis
if major_axes<=minor_axes
  error('Semimajor axis must be greater than semiminor axis');
end

% draw orbiting sphere
[surfHandle]=draw_sphere (planets_radii,major_axes,0);
hold on 
delete(surfHandle)
% draw stationary sphere
draw_sphere (star_radius,C,0);
% set axes limit
axis equal
xlim([(-planets_radii-major_axes),(planets_radii+major_axes)])
ylim([(-planets_radii-minor_axes),(planets_radii+minor_axes)])

% set the description data
xlabel('x axis')
ylabel('y axis')
zlabel('z axis')

% Angle of the elipse
t=-pi:((2*pi)/TimeSteps):pi;
elipse_x=major_axes*cos(t);
elipse_path=minor_axes*sin(t);
plot3(elipse_x,elipse_path,zeros(1,length(elipse_x)))
% hold off

drawnow
figH=gca;
% draws the orbits
for i=1:NumberOfOrbits
    for j=1:TimeSteps
  % to check if the program is still running to allow you to close the program
       if ~ishghandle(figH)
        break
       end
       delete(surfHandle)
       [surfHandle]=draw_sphere (planets_radii,elipse_x(j),elipse_path(j));
       drawnow 
%        saveGif(figH,j);
    end

end
