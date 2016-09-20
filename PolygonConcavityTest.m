function [ convex, counterclockwise, concavityResult ] = PolygonConcavityTest( points )
%POLYGONCONCAVITYTEST Tests the concavity of a polygon
%   The inpute argument is a 2 column matrix with the coordinates X & Y of the
%   points of a polygon. This function tests the concavity of the polygon and the orientation of points. The first
%   point must not be repeated at the end of the matrix of the points.


% Number of points = Number of Segments = Number of crossproducts
% For each 3 consecutive points (P1, P2, P3), two vectors v1 = P1P2 and v2 = P2P3 are formed.
% The cross product of the two vectors is calculated.
% The sign of the z-components of the cross product is needed.
% The polygon is convex if the z-components are either all positive or all negative. Otherwise the polygon is nonconvex (concave).
% All the crossproducts are positive = counterclockwise and convex
% All the crossproducts are negative = clockwise and convex
% Most crossproducts are positive = concave and counterclockwise
% Most crossproducts are negative = concave and clockwise

points = PointsAppendFirstUndo(points); %Ensure that the first point of the polygon is not repeated at the end of the matrix
numberOfPoints = length(points);    %Number of points
%crossProductsZ = zeros(numberOfPoints,1); %Pre-allocation (this variable
%is needed only for the alternative calculation
crossProducts=zeros(numberOfPoints,3); %Pre-allocation

for j = 1 : numberOfPoints

    if j==numberOfPoints %if Point1 is the last point, Point2 and Point3 continue from the start of the matrix
        p1 = j;
        p2 = 1;
        p3 = 2;
    elseif j==numberOfPoints-1  %if Point1 is the pre-last point, Point2 is the last point and Point3 continues from the start of the matrix
        p1 = j;
        p2 = j+1;
        p3 = 1;
    else
        p1 = j;
        p2 = j+1;
        p3 = j+2;
    end
    
    v1 = [points(p2,:) , 0] - [points(p1,:) , 0]; %vector1 P1P2 (each vector has 3 components X,Y,Z where Z is set to zero)
    v2 = [points(p3,:) , 0] - [points(p2,:) , 0]; %vector2 P2P3
    crossProducts(j,:) = cross(v1,v2); %The cross product of the two vector has 3 components X,Y,Z
    
%     Alternative calculation
%     dx1 = points(p2, 1) - points(p1, 1);
%     dy1 = points(p2, 2) - points(p1, 2);
%     dx2 = points(p3, 1) - points(p2, 1);
%     dy2 = points(p3, 2) - points(p2, 2);
%     crossProductsZconponets(j) = dx1*dy2 - dy1*dx2;
    
end

posCrossProducts = sum(crossProducts(:,3) > 0); %Number of positive Z components of cross products
negCrossProducts = sum(crossProducts(:,3) < 0); %Number of negative Z components of cross products

if posCrossProducts == numberOfPoints
    concavityResult = 'The shape is convex and oriented counterclockwise';
    convex = 1;
    counterclockwise = 1;
    
elseif negCrossProducts == numberOfPoints
    concavityResult = 'The shape is convex and oriented clockwise. Please reverse';
    convex = 1;
    counterclockwise = 0;
    
elseif posCrossProducts > negCrossProducts,
    concavityResult = 'The shape is concave and oriented counterclockwise';
    convex = 0; 
    counterclockwise = 1;
    
elseif posCrossProducts < negCrossProducts,
    concavityResult = 'The shape is concave and oriented clockwise.Please reverse';
    convex = 0;
    counterclockwise = 0;
    
else
    concavityResult = 'Concavity test error';
end

