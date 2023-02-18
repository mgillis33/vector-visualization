%% This code animates the tangent vectors and normal vectors of each point on a curve r(t) defined by bounds of t along with a step size. r(t) is a curve defined parametrically with r(t)=<x(t),y(t),z(t)>
%This example we will be using a curve defined as r(t) = <cos(t),sin(t),t>,
%with 0<t<6pi and a step size of 0.1
clear
close all;

%Initialize the curve, bounds of t, and step size
lowerBound = 0;
upperBound = 6*pi;
stepSize = 0.1;
t = lowerBound:stepSize:upperBound;
x = cos(t);
y = sin(t);
z = t;

%Plot the curve in the R^3 space.
rt = plot3(x,y,z,LineWidth = 3, Color = "k");

%Specify graph properties: title, labels, and axes
title("Curve r(t) with Tangent and Normal Vectors Plotted as a Function of Time")
xlabel('cos(t)');
ylabel('sin(t)'); 
zlabel('t');

grid on;
axis([-2 2 -2 2 lowerBound upperBound+1]);

%Hold on to make everything graph on the same figure
hold on

%A for loop that iterates through all values of t with the specified step size in order to graph each tangent &
%normal vector for r(t)
for i = t
    %Plot the tangent vector in red
    tn = quiver3(cos(i),sin(i),i,(sqrt(2)*-sin(i))/2,(sqrt(2)*cos(i))/2,sqrt(2)/2,Linewidth = 1, Color = [0.6350 0.0780 0.1840]);
    %Plot the normal vector in green
    n = quiver3(cos(i),sin(i),i,-cos(i),-sin(i),0,Linewidth = 1, Color = [0.4660 0.6740 0.1880]);
    %Add a legend, with r(t), tangent vector (T(t)), and normal vector (N(t)) assigned to
    %their specified colors
    legend([rt,tn,n],["r(t)","T(t)","N(t)"]);
    %Animate the plot with getframe, assigning it to a structure F
    F = getframe;
end
