function [outputArg1,outputArg2,outputArg3] = animateOrbit(R1,R2,A,B)
% Eg animateOrbit(200,25,1000,750)
NumberOfOrbits=100;
TimeSteps=100;
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
if (C+R1)> (A-R2)
  error('Collision imminent!');
end

% Validate that the inputs are numeric
if ~isnumeric(R1) || ~isnumeric(R2) || ~isnumeric(A) || ~isnumeric(B) 
  error('Inputs must be numeric!');
end

% Validate that the inputs are scalar
if ~isscalar(R1) || ~isscalar(R2) || ~isscalar(A) || ~isscalar(B) 
  error('Inputs must be scalar!');
end

% Validate that the input are positive
if R1<=0 || R2<=0 || A<=0 || B<=0
  error('All input values should be positive');
end

% Validate Semimajor axis must be greater than semiminor axis
if A<=B
  error('Semimajor axis must be greater than semiminor axis');
end

% draw orbiting sphere
[surfHandle,surfX,surfY]=draw_sphere (R2,A,0);
hold on 
% draw stationary sphere
draw_sphere (R1,C,0);
% set axes limit
axis equal
xlim([(-R2-A),(R2+A)])
ylim([(-R2-B),(R2+B)])

% set the description data
xlabel('x axis')
ylabel('y axis')
zlabel('z axis')


elipse_x=linspace(-A,A,TimeSteps);
elipse_upper=[sqrt(B^2-B^2/A^2*elipse_x.^2),-sqrt(B^2-B^2/A^2*elipse_x.^2)];
plot3([elipse_x,fliplr(elipse_x)],elipse_upper,zeros(1,length(elipse_upper)));
hold off
drawnow

% draws the orbits
for i=1:NumberOfOrbits
    for j=2:TimeSteps
        delta=elipse_upper(j)-elipse_upper(j-1);
        set(surfHandle,'XData',get(surfHandle,'XData')-A/(TimeSteps/2))
%         set(surfHandle,'YData',zeros(size(get(surfHandle,'YData'),1),size(get(surfHandle,'YData'),2))+elipse_upper(j))
        set(surfHandle,'YData',get(surfHandle,'YData')+delta)
        drawnow
        pause(.001)
    end
    for j=2:TimeSteps
        delta=elipse_upper(j)-elipse_upper(j-1);
        set(surfHandle,'XData',get(surfHandle,'XData')+A/(TimeSteps/2))
 %       set(surfHandle,'YData',zeros(size(get(surfHandle,'YData'),1),size(get(surfHandle,'YData'),2))-elipse_upper(j))
        set(surfHandle,'YData',get(surfHandle,'YData')-delta)
        drawnow
        pause(.001)
    end
end

end
