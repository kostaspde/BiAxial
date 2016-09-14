function [ points ] = PointsRotate( points, theta )
%POINTSROTATE Rotate set of points in 2D plane
%   Given a twp column matrix containing the coordinates X,Y of a set of points and an agnle (positive
%   means CounterClockWise), this function calculates the coordinates of the
%   points if they are rotated about (0,0) by the specified angle.

%   https://en.wikipedia.org/wiki/Transformation_matrix
%   https://en.wikipedia.org/wiki/Rotation_matrix

% x' = x*cos(theta) + y*sin(theta)
% y' =  - x*sin(theta) + y*cos(theta)

if theta~=0     %If theta is not zero
switch theta
    case 90
        R = [0 -1 ; 1 0];
    case 180
        R = [-1 0 ; 0 -1];
    case 270
        R = [0 1 ; -1 0];
    case -90
        R = [0 1 ; -1 0];
    case -180
        R = [-1 0 ; 0 -1];
    case -270
        R = [0 -1 ; 1 0];
    otherwise
        theta = deg2rad(theta);
        R = [cos(theta) -sin(theta) ; sin(theta) cos(theta)];
end
points = (R*points')';  %Apply transformation
end

end