function [ points ] = AppendFirstPoint( points )
%APPENDFIRSTPOINT Summary of this function goes here
%   Detailed explanation goes here
points = [points;points(1,:)];
end