function  animateOrbit(star_radius,R2,A,B)
% Eg animateOrbit(200,25,1000,750)
NumberOfOrbits=100;
TimeSteps=250;
%animates the orbit given the two radii (R1 and R2), and the semimajor and semiminor axes.
%Radius of the stationary body R1
%Radius of the orbiting body R2
%Semimajor axis A
%Semiminor axis B

%set default value for semi-minor axis B in case being missing
 if ~exist('B','var')
     % if B (Semiminor axis) doesn't exist then make it equal 
     % to A (Semimajor axis)
      B=A;
 end
% Validate that Collision doesn't occur
C=sqrt(A^2-B^2);
if (C+star_radius)> (A-R2)
  error('Collision imminent!');
end

% Validate that the inputs are numeric
if ~isnumeric(star_radius) || ~isnumeric(R2) || ~isnumeric(A) || ~isnumeric(B) 
  error('Inputs must be numeric!');
end

% Validate that the inputs are scalar
if ~isscalar(star_radius) || ~isscalar(R2) || ~isscalar(A) || ~isscalar(B) 
  error('Inputs must be scalar!');
end

% Validate that the input are positive
if star_radius<=0 || R2<=0 || A<=0 || B<=0
  error('All input values should be positive');
end

% Validate Semimajor axis must be greater than semiminor axis
if A<=B
  error('Semimajor axis must be greater than semiminor axis');
end

% draw orbiting sphere
[surfHandle]=draw_sphere (R2,A,0);
hold on 
delete(surfHandle)
% draw stationary sphere
draw_sphere (star_radius,C,0);
% set axes limit
axis equal
xlim([(-R2-A),(R2+A)])
ylim([(-R2-B),(R2+B)])

% set the description data
xlabel('x axis')
ylabel('y axis')
zlabel('z axis')

% Angle of the elipse
t=-pi:((2*pi)/TimeSteps):pi;
elipse_x=A*cos(t);
elipse_path=B*sin(t);
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
       [surfHandle]=draw_sphere (R2,elipse_x(j),elipse_path(j));
       drawnow 
%        saveGif(figH,j);
    end

end
