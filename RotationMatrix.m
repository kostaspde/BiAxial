function [ output_args ] = RotationMatrix( input_args )
%ROTATIONMATRIX Rotate set of points in 2D plane
%   Given a matrix containing point coordinates X,Y and an agnle (positive
%   means CounterClockWise, this function calculates the coordinates of the
%   points if they are rotated by the specified angle, about (0,0).

switch theta
    case 90
        R = [0 -1 ; 1 0];
    case 180
theta = deg2rad(theta) 
R = [cos(theta) -sin(theta) ; sin(theta) cos(theta)]
rotadedPoints = 

end

