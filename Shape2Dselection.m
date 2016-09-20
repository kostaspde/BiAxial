function [ points ] = Shape2Dselection( )
%SHAPE2DSELECTION Summary of this function goes here
%   Detailed explanation goes here
shapes = {'Rectangle', 'T', 'I', 'L', 'Pi', 'Cross', 'Z', 'Inscribed polygon','Custom Polygon'};
[shape] = listdlg('PromptString','Select a shape','SelectionMode','single','ListString',shapes);
dlg_title = shapes{shape}; %

switch shape
    case 1 %Rectangle
        prompt = {'Width (m):','Height (m):'};
        defaultans = {'0.5','0.5'};
        answer = inputdlg(prompt,dlg_title,1,defaultans);
        B = str2double(answer{1}); H = str2double(answer{2});
        points = [ 0 , 0   ;   B , 0   ;   B , H   ;   0 , H ];
        
    case 2 %T-section
        prompt = {'Web thickness (m):','Web height (m):','Flange width (m):','Flange thickness (m):','invert (yes/no):'};
        defaultans = {'0.25','0.5','1.00','0.15','no'};
        answer = inputdlg(prompt,dlg_title,1,defaultans);
        tw = str2double(answer{1}); H = str2double(answer{2}); B = str2double(answer{3}); tf = str2double(answer{4}); invert=answer{5};
        points = [ (B - tw)/2 , 0   ;   (B + tw)/2 , 0   ;   (B + tw)/2 , H - tf   ;   B , H - tf   ;   B , H   ;   0 , H   ;   0 , H - tf   ;   (B - tw)/2 , H - tf ];
        if strcmpi(invert,'yes')
            points = PointsMirrorXorY(points,'X');
            points = PointsBottomLeftRelocate(points);
        end
        
    case 3 %I-section
        prompt = {'Web thickness (m):','Web height (m):','Top Flange width (m):','Top Flange thickness (m):','Bottom Flange width (m):','Bottom Flange thickness (m):'};
        defaultans = {'0.05','0.5','1.00','0.10','0.80','0.15'};
        answer = inputdlg(prompt,dlg_title,1,defaultans);
        tw = str2double(answer{1}); H = str2double(answer{2}); B_top = str2double(answer{3}); tf_top = str2double(answer{4}); B_bot = str2double(answer{5}); tf_bot = str2double(answer{6});
        
        points = [ 0 , 0   ;   B_bot , 0   ;   B_bot , tf_bot   ;   (B_bot + tw)/2 , tf_bot   ;   (B_bot + tw)/2 , H - tf_top   ;   (B_bot + B_top)/2 , H - tf_top   ;   (B_bot + B_top)/2 , H   ; ...
            (B_bot - B_top)/2 , H   ;   (B_bot - B_top)/2 , H - tf_top   ;   (B_bot - tw)/2 , H - tf_top   ;   (B_bot - tw)/2 , tf_bot   ;   0 , tf_bot ];
        points = PointsBottomLeftRelocate(points);
        
    case 4 %L-section
        prompt = {'Web thickness (m):','Web height (m):','Flange width (m):','Flange thickness (m):','invert x (yes/no):','invert y (yes/no):'};
        defaultans = {'0.03','0.15','0.2','0.05','no','no'};
        answer = inputdlg(prompt,dlg_title,1,defaultans);
        tw = str2double(answer{1}); H = str2double(answer{2}); B = str2double(answer{3}); tf = str2double(answer{4}); invertX=answer{5} ; invertY=answer{6};
        points = [ 0 , 0   ;   B , 0   ;   B , tf   ;   tw , tf   ;   tw , H   ;   0 , H ];
        if strcmpi(invertX,'yes')
            points = PointsMirrorXorY(points,'X');
            points = PointsBottomLeftRelocate(points);
        end
        if strcmpi(invertY,'yes')
            points = PointsMirrorXorY(points,'Y');
            points = PointsBottomLeftRelocate(points);
        end
        
    case 5 %Pi-section
    prompt = {'Web thickness (m):','Web height (m):','Flange width (m):','Flange thickness (m):','invert x (yes/no):'};
        defaultans = {'0.03','0.15','0.2','0.05','no','no'};
        answer = inputdlg(prompt,dlg_title,1,defaultans);
        tw = str2double(answer{1}); H = str2double(answer{2}); B = str2double(answer{3}); tf = str2double(answer{4}); invertX=answer{5};
        points = [ 0 , 0   ;   tw , 0   ;   tw , H - tf   ;   B - tw , H - tf   ;   B - tw , 0   ;   B , 0   ;   B , H;   0 , H ];
        if strcmpi(invertX,'yes')
            points = PointsMirrorXorY(points,'X');
            points = PointsBottomLeftRelocate(points);
        end
        
    case 6 %Cross
        prompt = {'Web thickness (m):','Web height (m):','Flange width (m):','Flange thickness (m):'};
        defaultans = {'0.25','1.5','1.7','0.1'};
        answer = inputdlg(prompt,dlg_title,1,defaultans);
        tw = str2double(answer{1}); H = str2double(answer{2}); B = str2double(answer{3}); tf = str2double(answer{4});
        points = [ (B - tw)/2 , 0   ;   (B + tw)/2 , 0   ;   (B + tw)/2 , (H - tf)/2   ;   B , (H - tf)/2   ;   B , (H + tf)/2   ;   (B + tw)/2 , (H + tf)/2   ;   (B + tw)/2 , H   ; ...
               (B - tw)/2 , H   ;   (B - tw)/2 , (H + tf)/2   ;   0 , (H + tf)/2   ;   0 , (H - tf)/2   ;   (B - tw)/2 , (H - tf)/2   ];

    case 7 %Z-section
        prompt = {'Web thickness (m):','Web height (m):','Top Flange width (m):','Top Flange thickness (m):','Bottom Flange width (m):','Bottom Flange thickness (m):','invert y (yes/no):'};
        defaultans = {'0.25','0.70','0.50','0.15','0.80','0.10','no'};
        answer = inputdlg(prompt,dlg_title,1,defaultans);
        tw = str2double(answer{1}); H = str2double(answer{2}); B_top = str2double(answer{3}); tf_top = str2double(answer{4}); B_bot = str2double(answer{5}); tf_bot = str2double(answer{6}) ; invertY=answer{7};
        
        points = [   (B_top - tw) , 0   ;   (B_top + B_bot - tw) , 0   ;   (B_top + B_bot - tw) , tf_bot   ;   B_top , tf_bot   ;   B_top , H   ;   0 , H   ;   0 , H - tf_top   ;   (B_top - tw) , H - tf_top   ];
        if strcmpi(invertY,'yes')
            points = PointsMirrorXorY(points,'Y');
            points = PointsBottomLeftRelocate(points);
        end

    case 8 %Inscribed polygon
        prompt = {'Radius of circle (m):','Number of Edges:'};
        defaultans = {'1.00','5'};
        answer = inputdlg(prompt,dlg_title,1,defaultans);
        B = str2double(answer{1}); sides = str2num(answer{2});
        
    if mod(sides,2) == 0
        if mod(sides/2,2) == 0
            tf = (1/(2*sides):1/sides:1)'*2*pi;
        else
            tf = (0:1/sides:1-1/sides)'*2*pi;
        end
    else
            tf = (pi/2:2*pi/sides:2*pi+pi/2-2*pi/sides)';
    end
    points = B*[cos(tf), sin(tf)];
    
    case 9 %Custom Polygon
        points = [];
        prompt = {'X:','Y:'};
        stop=false;
        while stop==0;
        answer = inputdlg(prompt,dlg_title,1);
        if isempty(answer);
            stop=true;
        else
        points = [points; str2double(answer{1}), str2double(answer{2})];
        end
        end
end

% pointsToPlot = PointsAppendFirst(points);
% x = pointsToPlot(:,1);y = pointsToPlot(:,2);plot(x,y,'.-','Linewidth',2.5);

% fill(points(:,1),points(:,2),'r')
end