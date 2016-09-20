function [ result ] = VerticalTest( points )
%VERTICALTEST Tests whether a line segmnet is vertical or not
%   Given a 2 column matrix with the coordinates X&Y of two points P1 & P2,
%   this functions cheacks if the line is vertical or not

if points(1,1) == points(2,1) %if the two points P1,P2 have the same x coordinate, then the line is vertical
result = 1; %true means that it is vertical
end
end

