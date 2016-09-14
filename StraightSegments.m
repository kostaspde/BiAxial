function [ segment ] = StraightSegments( points )
%STRAIGHTSEGMENTS Summary of this function goes here
%   Detailed explanation goes here

x1 = points(1,1);  y1 = points(1,2);
x2 = points(2,1);  y2 = points(2,2);
a = (y2-y1)/(x2-x1);
b = y1 - a*x1;

field1 = 'x1';  value1 = x1;
field2 = 'y1';  value2 = y1;
field3 = 'x2';  value3 = x2;
field4 = 'y2';  value4 = y2;
field5 = 'a';   value5 = (y2-y1)/(x2-x1);
field6 = 'b';   value6 = b;
field7 = 'isVertical';   value7 = 0;


segment = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6);

x(t_i) = x_i*(1-t) + t*x_i+1 ;
y(t_i) = y_i*(1-t) + t*y_i+1 ;

% y(Subscript[t, i]) = Subscript[y, i] (1-t) + t Subscript[y, i+1]
% x'(Subscript[t, i]) = -Subscript[x, i] + Subscript[x, i+1]
% y'(Subscript[t, i]) = -Subscript[y, i] + Subscript[y, i+1]
end

