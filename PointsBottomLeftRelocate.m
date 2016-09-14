function [ points ] = PointsBottomLeftRelocate( points )
%POINTSBOTTOMLEFTRELOCATE Relocates a set of points to the first quadrant
%   The inpute argument is a 2 column matrix with the coordinates of the
%   points of a polygon. This function relocates the polygon so that the
%   left most point x coordinate becomes 0 and the bottom most point y
%   coordinate becomes 0.

hor = min(points(:,1)); %Find the minimum X coordinate among all the points
ver = min(points(:,2)); %Find the minimum Y coordinate among all the points

points(:,1)= points(:,1)-hor;  %Shift all points horizontally by hor
points(:,2)= points(:,2)-ver;  %Shift all points vertically by ver

end

