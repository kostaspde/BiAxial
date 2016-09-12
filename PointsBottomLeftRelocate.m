function [ points ] = PointsBottomLeftRelocate( points )
%POINTSBOTTOMLEFTRELOCATE Summary of this function goes here
%   Detailed explanation goes here
hor = min(points(:,1));
ver = min(points(:,2));

points(:,1)= points(:,1)-hor;
points(:,2)= points(:,2)-ver;
end

