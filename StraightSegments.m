function [ segment ] = StraightSegments( points )
%STRAIGHTSEGMENTS Creates the line segments that consist a polygon
%   The inpute argument is a 2 column matrix with the coordinates X & Y of the
%   points of a polygon. This function creates a structure of arrays, which
%   are the start-and-endpoint coordinates of the segments of the polygon.
%   The first point should not be repeated at the end of the input matrix.

% x1 = points(1,1);  y1 = points(1,2);
% x2 = points(2,1);  y2 = points(2,2);
% a = (y2-y1)/(x2-x1);
% b = y1 - a*x1;

points = PointsAppendFirstUndo(points);
field1 = 'x1';  value1 = points(:,1);
field2 = 'y1';  value2 = points(:,2);
field3 = 'x2';  value3 = [points(2:end,1);points(1,1)];
field4 = 'y2';  value4 = [points(2:end,2);points(1,2)];

segment = struct(field1,value1,field2,value2,field3,value3,field4,value4);

% x(t_i) = x_i*(1-t) + t*x_i+1 ;
% y(t_i) = y_i*(1-t) + t*y_i+1 ;

end

