clear; clc;

points = Shape2Dselection;

pointsToPlot = PointsAppendFirst(points);
x = pointsToPlot(:,1);y = pointsToPlot(:,2);plot(x,y,'.-','Linewidth',2.5);

points = PointsAppendFirst(points);
segments = StraightSegments(points);

[~, ~, concavityResult]=PolygonConcavityTest(points);

% fill(points(:,1),points(:,2),'r')