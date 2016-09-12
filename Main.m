clear; clc;

points = Shape2Dselection;

segments = Segments(points);
pointsToPlot = AppendFirstPoint(points);
x = pointsToPlot(:,1);y = pointsToPlot(:,2);plot(x,y,'.-','Linewidth',2.5);



% fill(points(:,1),points(:,2),'r')