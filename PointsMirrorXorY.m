function [ points ] = PointsMirrorXorY(points , MirrorAxis)
%POINTSMIRRORXORY Mirror points about X or Y axis.
%   The inpute argument is a 2 column matrix with the coordinates X & Y of the
%   points of a polygon. This function mirrors the points about X or Y axis.

if strcmpi(MirrorAxis,'x')== 1
    R = [1 0 ; 0 -1];   %Transformation matrix for mirror about X
else
    R = [-1 0 ; 0 1];   %Transformation matrix for mirror about Y
end
points = (R*points')';  %Apply the transformation
end
