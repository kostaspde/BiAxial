clear; clc;

points = Shape2Dselection;

points = EditShape2d(points);

pointsToPlot = AppendFirstPoint(points);
x = pointsToPlot(:,1);y = pointsToPlot(:,2);plot(x,y,'.-','Linewidth',2.5);

% fill(points(:,1),points(:,2),'r')