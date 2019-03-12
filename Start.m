%% Initial Clear Section
clear % Clear any remaining variables in the workspace
close all % Close any open process from previous executions (Like: figures)
clc % Clear the command window

%% Add global declarations
global NumberOfCirculations speeds TimeSteps
NumberOfCirculations=100;
speeds=[4 2 1];
TimeSteps=200;

%% Testing lines if needed
% Test 1
% draw_sphere(5,0,0);
% Test 2
% animateOrbit(StarRadius,planetRadius,majorAxis,minorAxis)
% animateOrbit(200,25,1000,750);
% Test 3
% animateOrbit(StarRadius,planetsRadii,majorAxes,minorAxes) - all parallel
% animateOrbit(300,[25 150 75],[1000,2000,3000],[750,1500,2250]);
% Test 4
% animateOrbit(StarRadius,planetRadius,majorAxis,minorAxis) 
% - not parallel prbits
% animateOrbit(300,[25 150 75],[1300,2200,3500],[1000,2000,2500]);

%% Start Script section
animateOrbit(300,[25 150 75],[1300,2200,3500],[1000,2000,2500]);
