function [ points ] = PointsAppendFirst( points )
%POINTSAPPENDFIRST Appends the first point of a polygon at the end of the
%matrix of the polygon points
%   The inpute argument is a 2 column matrix with the coordinates X & Y of the
%   points of a polygon. This function adds another row with the
%   coordinates of the first point of polygon (first row of the matrix).

s = sum(points(1,:)==points(end,:)); %Check if the first point is already copied at the end of the matrix
if  s~=2    %if the first and last point are not the same, then append the first point to the matrix.
   points = [points;points(1,:)]; %Add the first point to the end of the matrix
end
end