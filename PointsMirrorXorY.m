function [ points ] = PointsMirrorXorY(points , MirrorAxis)
%POINTSMIRRORX
%   Detailed explanation goes here
if strcmpi(MirrorAxis,'x')== 1
    R = [1 0 ; 0 -1];
else
    R = [-1 0 ; 0 1];
end
points = (R*points')';
end
