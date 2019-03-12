function  animateOrbit(star_radius,planets_radii,major_axes,minor_axes)
% Eg animateOrbit(200,25,1000,750)
NumberOfOrbits=100;
TimeSteps=250;
%animates the orbit given the two radii (R1 and R2), and the semimajor and semiminor axes.
%Radius of the stationary body R1
%Radius of the orbiting body R2
%Semimajor axis A
%Semiminor axis B
days=[1 2 3];
%set default value for semi-minor axis B in case being missing
 if ~exist('minor_axes','var')
     % if B (Semiminor axis) doesn't exist then make it equal 
     % to A (Semimajor axis)
      minor_axes=major_axes;
 end
% Validate that Collision doesn't occur
for i=1:length(planets_radii)
C=sqrt(major_axes(1)^2-minor_axes(1)^2);
if (C+star_radius)> (major_axes(i)-planets_radii(i))
  error('Collision imminent!');
end

% Validate that the inputs are numeric
if ~isnumeric(star_radius) || ~isnumeric(planets_radii(i)) || ~isnumeric(major_axes(i)) || ~isnumeric(minor_axes(i)) 
  error('Inputs must be numeric!');
end

% Validate that the inputs are scalar
if ~isscalar(star_radius) || ~isscalar(planets_radii(i)) || ~isscalar(major_axes(i)) || ~isscalar(minor_axes(i)) 
  error('Inputs must be scalar!');
end

% Validate that the input are positive
if star_radius<=0 || planets_radii(i)<=0 || major_axes(i)<=0 || minor_axes(i)<=0
  error('All input values should be positive');
end

% Validate Semimajor axis must be greater than semiminor axis
if major_axes(i)<=minor_axes(i)
  error('Semimajor axis must be greater than semiminor axis');
end
end

for count=1:length(planets_radii)
surfHandle(count)=draw_sphere(planets_radii(count),-major_axes(count),0);
hold on 
end


% draw stationary sphere
draw_sphere (star_radius,C,0);
% set axes limit
axis equal
% xlim([(-planets_radii-major_axes),(planets_radii+major_axes)])
% ylim([(-planets_radii-minor_axes),(planets_radii+minor_axes)])
xlim([(-max(planets_radii)-max(major_axes)),(max(planets_radii)+max(major_axes))])
ylim([(-max(planets_radii)-max(minor_axes)),(max(planets_radii)+max(minor_axes))])

% set the description data
xlabel('x axis')
ylabel('y axis')
zlabel('z axis')

% Angle of the elipse
for count=1:length(planets_radii)

t=-pi:((2*pi)/TimeSteps):pi;
elipse_x(count,:)=major_axes(count)*cos(t);
elipse_path(count,:)=minor_axes(count)*sin(t);
plot3(elipse_x(count,:),elipse_path(count,:),zeros(1,length(elipse_x)))
end
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
       for count=1:length(planets_radii)
       delete(surfHandle(count))
       end
       for count=1:length(planets_radii)
       surfHandle(count)=draw_sphere (planets_radii(count),elipse_x(count,j),elipse_path(count,j));
       end
       drawnow 
%        saveGif(figH,j);
    end

end
