function [ points ] = PointsReverseOrder( points )
%POINTSREVERSEORDER Revese the order of a matrix containing coordinates
%of points
%   The inpute argument is a 2 column matrix with the coordinates X & Y of the
%   points of a polygon. This function reverses each column, so that the
%   order of the rows is reversed. The first row becomes last and so on...

points = flip(points,1); %Reverses each column top to bottom
end

