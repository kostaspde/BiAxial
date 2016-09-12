
%% CROSS SECTION SHAPE
clear; clc;
shapes = {'Rectangle', 'T', 'I', 'L', 'Gamma', 'Pi', 'Cross', 'Inscribed polygon','Custom'};
[shape,SelectionResult] = listdlg('PromptString','Select a shape','SelectionMode','single','ListString',shapes);
d1 = 0.05;
barDiameter = 20;
B = 2; H = 0.8; S = 0.2;
sides = 3;
switch shape
    case 1
    points = [0,0 ; B,0; B,B; 0,B];
    case 2
    points = [(B - S)/2, 0; (B + S)/2, 0; (B + S)/2, H - S; B, H - S; B, H; 0, H; 0, H - S; (B - S)/2, H - S];
    case 3
    points = [0 , 0 ; B , 0 ; B , S ; (B + S)/2, S ; (B + S)/2, H - S ; B , H - S ; B , H ; 0 , H ; 0, H - S ; (B - S)/2, H - S ; (B - S)/2, S ; 0, S];
    case 4
    points = [0, 0 ; B, 0 ; B, S ; S, S ; S, H ; 0, H];
    case 5
    points = [0, 0 ; S, 0 ; S, H - S ; B, H - S ; B, H ; 0, H];
    case 6
    points = [0, 0 ; S, 0 ; S, H - S ; B - S, H - S ; B - S, 0 ; B, 0 ; B, H ; 0, H];
    case 7
    points = [(B - S)/2, 0 ; (B + S)/2, 0 ; (B + S)/2, (H - S)/2 ; B, (H - S)/2 ; B, (H + S)/  2 ; (B + S)/2, (H + S)/2 ; (B + S)/2, H ; (B - S)/2,  H ; (B - S)/2, (H + S)/2 ; 0, (H + S)/2 ; 0, (H - S)/ 2 ; (B - S)/2, (H - S)/2];
    case 8
    if mod(sides,2) == 0
        if mod(sides/2,2) == 0
            t = (1/(2*sides):1/sides:1)'*2*pi;
        else
            t = (0:1/sides:1-1/sides)'*2*pi;
        end
    else
            t = (pi/2:2*pi/sides:2*pi+pi/2-2*pi/sides)';
    end
    points = B*[cos(t), sin(t)];
    case 9
    points = [];
end

fill(points(:,1),points(:,2),'r')
axis equal
%% 
