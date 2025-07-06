function varargout = BranchTerminal(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BranchTerminal_OpeningFcn, ...
                   'gui_OutputFcn',  @BranchTerminal_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end






% End initialization code - DO NOT EDIT

% --- Executes just before BranchTerminal is made visible.
function BranchTerminal_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;


guidata(hObject, handles);                                                 % Update handles structure


if strcmp(get(hObject,'Visible'),'off')                                    % This sets up the initial plot - only do when we are invisible
                                                                            % so window can get raised using BranchTerminal.
    plot(rand(5));
end

% UIWAIT makes BranchTerminal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BranchTerminal_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;





% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)



% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)

selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)



function popupmenu1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});


% --- Select File
function pushbutton2_Callback(hObject, eventdata, handles)
                

             global k num_imgs pathname filename z xsize ysize a1
             

                BP =[];
                assignin('base','BP',BP);
                h_BP = {};
                assignin('base','h_BP',h_BP);
                h_MI = {};
                assignin('base','h_MI',h_MI);
                h_y = {};
                assignin('base','h_y',h_y);
                h_x = {};
                assignin('base','h_x',h_x);       
                
                z = 1;               
                assignin('base','z',z);
                x = 1;               
                assignin('base','x',x);
                y = 1;               
                assignin('base','y',y);


                load('X.mat');load('Y.mat');load('Z.mat');
                Im = Z;
                Im_max=max(Im,[],3);
                a1 = Im;
                assignin('base','a1',a1);
                imshow(Im_max, 'parent', handles.axes2); 
                assignin('base','Im',Im); 
%                 Xm = permute(Im,[1 3 2]); 
%                 Ym = permute(Im,[3 2 1]);
                Xm = X;
                Ym = Y;


                xsize = size(Im,1);
                ysize = size(Im,2);
                
                im3dscroll(Im,handles);
                
                
                im3dmouse(Xm,handles);
                
                
                im3dmouse2(Ym,handles);
                hold(handles.axes1,'on');
                hold(handles.axes2,'on');
                hold(handles.axes3,'on');
                hold(handles.axes6,'on');
                
                linkaxes([handles.axes1 handles.axes2],'xy');
                linkaxes([handles.axes1 handles.axes3],'y');
                linkaxes([handles.axes1 handles.axes6],'x');

%                 axis(handles.axes1,[0 512 0 512]);  
%                 axis(handles.axes3,[0 57 0 512]);
                
                
                
                
                
                
                
                
               
function [] = im3dscroll(IM,handles)
                hf = handles.figure1;
                hf.Visible='on';
                ha= handles.axes1;
                ha.Units='pixels';
                ha.Position=[20 200 512 512];
                z=evalin('base','z');
                h_im = imshow(IM(:,:,z),'Parent',ha);
                hf.UserData.IM = IM;
                hf.UserData.currplane = 1;
                hf.UserData.h_im = h_im;
                ha.Title.String = ['Current plane: ',num2str(hf.UserData.currplane)];
                hf.WindowScrollWheelFcn = {@ScrollFcn, handles};
                hf.Visible='on';
                
                
                
% %                 
% %  function [] = im3dmouse(XM,handles)
% %                 gf = handles.figure1;
% %                 gf.Visible='on';
% %                 ga3 = handles.axes3;
% %                 ga3.Units ='pixels'; 
% %                 ga3.Position = [552 200 512 512];
% %                 x = evalin('base','x');
% %                 y = evalin('base','y');
% %                 gf.UserData.XM = XM;                
% %                 g_xm = imshow(gf.UserData.XM(:,:,round(x)),'Parent',ga3);                                
% %                 gf.UserData.curr = 1;
% %                 gf.UserData.g_xm = g_xm;         
% %                 ga3.Title.String = ['Current X plane: ',num2str(gf.UserData.curr)];
% %                 gf.WindowButtonMotionFcn = {@mouseMove, handles};                            
% %                 gf.Visible='on';  
% %                 ga3.Toolbar.Visible = 'on';
%                 tf = isAllowAxesZoom(zoom,ga3);
%                 setAllowAxesZoom(zoom,ga3,tf,true);


                

                

    
    
    
    
function [] = im3dmouse2(YM,handles)
                jf = handles.figure1;
                jf.Visible='on';
                ja6= handles.axes6;
                ja6.Units='pixels'; 
                ja6.Position = [20 200-20-57 512 57];
                x=evalin('base','x');
                y=evalin('base','y');
                jf.UserData.YM = YM;                                
                j_ym = imshow(jf.UserData.YM(:,:,round(y)),'Parent',ja6);                             
                jf.UserData.c = 1;
                jf.UserData.j_ym = j_ym;         
                ja6.Title.String = ['Current Y plane: ',num2str(jf.UserData.c)];
                jf.WindowButtonMotionFcn = {@Move2, handles};
                jf.Visible='on';  
    
    
function Move2(object, eventdata,handles)
    
    if ~isfield(handles, 'side_pointer') || ~ishandle(handles.side_pointer)
      pointersize = 30;
      handles.side_pointer = scatter(nan, nan, pointersize, 'y', 'Marker', '*');
      guidata(object, handles);
    end
    C = get(handles.axes1, 'CurrentPoint');
    a1 = evalin('base','a1');
    x = evalin('base','x');
    y = evalin('base','y');
    if C(1,1)>0 && C(1,1)<size(a1,2) && C(1,2) > 0 && C(1,2)<size(a1,1)
        x = C(1,1);
        y = C(1,2);
    end

    assignin('base','x',round(x));
    assignin('base','y',round(y));
                   
    jf = handles.figure1;
    ja6 = handles.axes6;
    ji = jf.UserData.j_ym;
    %Update image
 
    if ~isempty(ji)

        if  x>0 & x<size(a1,2) & y>0 & y<size(a1,1)
           
            
            ji.CData=jf.UserData.YM(:,:,round(y));
            
            p = jf.UserData.c;
            jf.UserData.c = round(y);
        end
    end
   
    ja6.Title.String=['Current Y Plane: ',num2str(round(y))];
    
    
    gf = handles.figure1;
    ga3 = handles.axes3;
    gi = gf.UserData.g_xm;
    %Update image

    if ~isempty(gi)

        if  x>0 & x<size(a1,2) & y>0 & y<size(a1,1)
            gi.CData=gf.UserData.XM(:,:,round(x)); %%
            prev = gf.UserData.curr;
            gf.UserData.curr = round(x);
   
        end
    end
    ga3.Title.String=['Current X Plane: ',num2str(round(x))];
    
    l = findobj(handles.axes3,'Tag',num2str(prev));
    if isprop(l,'MarkerEdgeColor')
        set(l,'MarkerSize',1);
    end
    l = findobj(handles.axes3,'Tag',num2str(gf.UserData.curr));
    if isprop(l,'MarkerEdgeColor')
        set(l,'MarkerSize',12);
    end
    
    j = findobj(handles.axes6,'Tag',num2str(p));
    if isprop(j,'MarkerEdgeColor')
        set(j,'MarkerSize',1);
    end
    j = findobj(handles.axes6,'Tag',num2str(gf.UserData.c));
    if isprop(j,'MarkerEdgeColor')
        set(j,'MarkerSize',12);
    end    
   
    
    
    
    
    
    
    
    
    
   
 




    
  
                

function ScrollFcn(src,ed,handles)
hf = handles.figure1;
ha = handles.axes1;
hi = hf.UserData.h_im;


%Update image
if ~isempty(hi)
    prevplane=hf.UserData.currplane;
    if ed.VerticalScrollCount>0
        hf.UserData.currplane=min(hf.UserData.currplane+ed.VerticalScrollCount,size(hf.UserData.IM,3));
    else
        hf.UserData.currplane=max(hf.UserData.currplane+ed.VerticalScrollCount,1);
    end
    hi.CData=hf.UserData.IM(:,:,hf.UserData.currplane);
    
end
z = hf.UserData.currplane;               
assignin('base','z',z)


%Update axis
% ha.Title.String=['Current plane: ',num2str(hf.UserData.currplane)];
ha.Title.String=['Current Z Plane: ',num2str(z)];

%Update points the first figure
h = findobj(handles.axes1,'Tag',num2str(prevplane));
if isprop(h,'MarkerEdgeColor')
%     set(h,'MarkerEdgeColor',[0.5 0 0],'MarkerSize',5)
    set(h,'MarkerSize',1)
end
h = findobj(handles.axes1,'Tag',num2str(hf.UserData.currplane));
if isprop(h,'MarkerEdgeColor')
%     set(h,'MarkerEdgeColor',[1 0 0],'MarkerSize',12)
    set(h,'MarkerSize',12)
end

%Update points the second figure
g = findobj(handles.axes2,'Tag',num2str(prevplane));
if isprop(g,'MarkerEdgeColor')
    set(g,'MarkerSize',1);
end
g = findobj(handles.axes2,'Tag',num2str(hf.UserData.currplane));
if isprop(g,'MarkerEdgeColor')
    set(g,'MarkerSize',12);
end






         


% --- Locate Branch Points.
function pushbutton5_Callback(hObject, eventdata, handles)
                 global  xx yy z xsize ysize
                 
                 hf = handles.figure1;
                 ha = handles.axes1;
                 ha2 = handles.axes2;
                 hi = hf.UserData.h_im;
                 
%                  gf = handles.figure1;
%                  ga3 = handles.axes3;
%                  gi = gf.UserData.g_xm;
                 
                 z = hf.UserData.currplane;               
                 assignin('base','z',z);
                 
                 BP=evalin('base','BP');                                      % read branch points from the work space
                 h_BP = evalin('base','h_BP');
                 h_MI = evalin('base','h_MI');
                 h_y = evalin('base','h_y');
                 h_x = evalin('base','h_x');
                 
% %                zz = evalin('base','x');

                 [xx,yy,but] = ginput(1);

                 
                 if xx>0 & xx <xsize & yy>0 & yy <ysize
                     BP = [BP;xx yy z 0];
                     assignin('base','BP',BP)                                  % save branch points into the work space
                 
                     h_branch_point = plot(xx,yy,'ro','Parent',handles.axes1,'Tag',num2str(round(z)));
                     h_Max_intensity = plot(xx,yy,'ro','Parent',handles.axes2,'Tag',num2str(round(z)));
                     h_yz = plot(z,yy,'ro','Parent',handles.axes3,'Tag',num2str(round(xx))); 
                     h_xz = plot(xx,z,'ro','Parent',handles.axes6,'Tag',num2str(round(yy))); %%yplane
                     
                     h_BP{length(h_BP)+1} = h_branch_point;
                     h_MI{length(h_MI)+1} = h_Max_intensity;
                     h_y{length(h_y)+1} = h_xz;
                     h_x{length(h_x)+1} = h_yz;
                     assignin('base','h_BP',h_BP);
                     assignin('base','h_MI',h_MI);
                     assignin('base','h_y',h_y);
                     assignin('base','h_x',h_x);
                 end

                 
                 



% --- Plane
function axes1_ButtonDownFcn(hObject, eventdata, handles)







% --- Delete points
function pushbutton9_Callback(hObject, eventdata, handles)
global x y z
            hf = handles.figure1;
            ha = handles.axes1;
            ha2 = handles.axes2;
            hi = hf.UserData.h_im;
                 
            z = hf.UserData.currplane;               
            assignin('base','z',z);
                 
            BP = evalin('base','BP');                                      % read branch points from the work space
            h_BP = evalin('base','h_BP');
            h_MI = evalin('base','h_MI');            
            h_y = evalin('base','h_y');
            
            linkaxes([handles.axes1 handles.axes2],'xy');
            linkaxes([handles.axes1 handles.axes3],'y');
            
            xplot=[];
            yplot=[];
            for i=1:length(BP(:,3))
                if BP(i,3) == z
                    xplot(end+1)= BP(i,1);
                    yplot(end+1)= BP(i,2);
                end
            end
            assignin('base','xplot',xplot)
            assignin('base','yplot',yplot)

            if length(xplot)>0 
                
% Transpose into column
                if iscolumn(xplot)==1
                    xplot =xplot;
                    yplot =yplot;
                else
                    xplot = transpose(xplot);
                    yplot = transpose(yplot);
                end
            
            


% select point to delete


            
                [ptsx,ptsy]=ginput(1);
                idx = knnsearch([xplot yplot],[ptsx ptsy],'k',1) ;
     
% update BP
                x = xplot(idx);
                y = yplot(idx);
                [a d] =find(BP==x);
                [b e] =find(BP==y);
                index = intersect(a,b);
                BP(index,:) =[];
                assignin('base','BP',BP);

                delete(h_BP{index});
                h_BP(index) = [];
                assignin('base','h_BP',h_BP);

                delete(h_MI{index});
                h_MI(index) = [];
                assignin('base','h_MI',h_MI);
                
                delete(h_y{index});
                h_y(index) = [];
                assignin('base','h_y',h_y);


                xplot(idx) = [] ;
                yplot(idx) = [] ;
                assignin('base','xplot',xplot)
                assignin('base','yplot',yplot)
            end



            
            
            


% --- Locate Terminal Point
function pushbutton11_Callback(hObject, eventdata, handles)
global  x y z
                
                 hf = handles.figure1;
                 ha = handles.axes1;
                 ha2 = handles.axes2;
                 hi = hf.UserData.h_im;
                 
                 z = hf.UserData.currplane;               
                 assignin('base','z',z);
                 
                 BP=evalin('base','BP');                                      % read branch points from the work space
                 h_BP = evalin('base','h_BP');
                 h_MI = evalin('base','h_MI');
                 h_y = evalin('base','h_y');
                 h_x = evalin('base','h_x');
                 
                 
                 linkaxes([handles.axes1 handles.axes2],'xy');
                 [xx,yy,but] = ginput(1);
                 
                 BP = [BP;xx yy z 1];
                 assignin('base','BP',BP);                                  % save branch points into the work space
                 
                 h_branch_point = plot(xx,yy,'go','Parent',handles.axes1,'Tag',num2str(z));  %%zplane
                 h_Max_intensity = plot(xx,yy,'go','Parent',handles.axes2,'Tag',num2str(z));
                 h_yz = plot(z,yy,'go','Parent',handles.axes3,'Tag',num2str(round(xx))); %%xplane
                 h_xz = plot(xx,z,'go','Parent',handles.axes6,'Tag',num2str(round(yy))); %%yplane
                 
                 h_BP{length(h_BP)+1} = h_branch_point;
                 h_MI{length(h_MI)+1} = h_Max_intensity;                 
                 h_x{length(h_x)+1} = h_yz;
                 h_y{length(h_y)+1} = h_xz;
                 assignin('base','h_BP',h_BP);
                 assignin('base','h_MI',h_MI);
                 assignin('base','h_y',h_y);
                 assignin('base','h_x',h_x);
                 

% --- Save File
function pushbutton13_Callback(hObject, eventdata, handles)
global  pathname 

    BP=evalin('base','BP');
    h_BP=evalin('base','h_BP');
    h_MI=evalin('base','h_MI');
    h_y=evalin('base','h_y');
    filter = {'*.mat'};
    [file, path] = uiputfile(filter);
    save(fullfile(path, file),'BP','h_BP','h_MI','h_y');   
%     save(fullfile(pathname,'label05'),'BP','h_BP','h_MI');
    


% --- Load file
function pushbutton14_Callback(hObject, eventdata, handles)                   
                 global   z
                 hf = handles.figure1;
                 ha = handles.axes1;
                 ha2 = handles.axes2;
                 ha3 = handles.axes3;
                 hi = hf.UserData.h_im;

                 
                 z = hf.UserData.currplane;               
                 assignin('base','z',z);
                 
                 [file,path] = uigetfile();
                 data = load(fullfile(path, file));   
                 assignin('base','BP',data.BP);                   
                 assignin('base','h_BP',data.h_BP);
                 assignin('base','h_MI',data.h_MI);
                 assignin('base','h_y',data.h_y);
                 
                 BP = evalin('base','BP');
                 h_BP = evalin('base','h_BP');
                 h_MI = evalin('base','h_MI');
                 h_y = evalin('base','h_y');
                 
                 
                 for i = 1:length(h_BP)
                     h_BP{i}.Parent = handles.axes1;
                     h_MI{i}.Parent = handles.axes2;
                     h_y{i}.Parent = handles.axes3;
                 end
                 
                 
%                 h_y = {}; 
%                 for i = 1:length(BP)
%                      if BP(i,4) == 0                     
%                         h_xz = plot(BP(i,3),BP(i,2),'go','Parent',handles.axes3,'Tag',num2str(round(data.BP(i,1))));
%                      elseif BP(i,4) == 1                       
%                         h_xz = plot(BP(i,3),BP(i,2),'ro','Parent',handles.axes3,'Tag',num2str(round(data.BP(i,1))));
%                      end
%                     
%                      h_y{length(h_y)+1} = h_xz;
%                 end
%                  for i = 1:length(h_BP)          
%                      h_y{i}.Parent = handles.axes3;
%                  end
%                  h_y = evalin('base','h_y');
%                  assignin('base','h_y',h_y); 
                 
                 
                 

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Unknown Points
function pushbutton15_Callback(hObject, eventdata, handles)
global  x y z
                
                 hf = handles.figure1;
                 ha = handles.axes1;
                 ha2 = handles.axes2;
                 ha3 = handles.axes3;
                 hi = hf.UserData.h_im;
                 
                 z = hf.UserData.currplane;               
                 assignin('base','z',z);
                 
                 BP=evalin('base','BP');                                      % read branch points from the work space
                 h_BP = evalin('base','h_BP');
                 h_MI = evalin('base','h_MI');

                 
                 linkaxes([handles.axes1 handles.axes2],'xy');
                 [x,y,but] = ginput(1);
                 
                 BP = [BP;x y z 2];
                 assignin('base','BP',BP)                                  % save branch points into the work space
                 
                 h_branch_point = plot(x,y,'mo','Parent',handles.axes1,'Tag',num2str(z));
                 h_Max_intensity = plot(x,y,'mo','Parent',handles.axes2,'Tag',num2str(z));
                 
                 h_BP{length(h_BP)+1} = h_branch_point;
                 h_MI{length(h_MI)+1} = h_Max_intensity;
                 assignin('base','h_BP',h_BP)
                 assignin('base','h_MI',h_MI)


% --- Save file.
function pushbutton19_Callback(hObject, eventdata, handles)
                 global   z
                 hf = handles.figure1;
                 ha = handles.axes1;
                 ha2 = handles.axes2;
                 ha3 = handles.axes3;
                 hi = hf.UserData.h_im;


                 z = hf.UserData.currplane;               
                 assignin('base','z',z);

                 [file,path] = uigetfile();
                 data = load(fullfile(path, file));  

                 assignin('base','BP',data.BP);   
                 BP = evalin('base','BP');
%                  h_BP = evalin('base','h_BP');
%                  h_MI = evalin('base','h_MI');
                h_BP = {};
                h_MI = {};
                h_y = {};
                
                 
                 for i = 1:length(BP)
                     if BP(i,4) == 0
                        h_branch_point = plot(BP(i,1),BP(i,2),'go','Parent',handles.axes1,'Tag',num2str(round(data.BP(i,3))));
                        h_Max_intensity = plot(BP(i,1),BP(i,2),'go','Parent',handles.axes2,'Tag',num2str(round(data.BP(i,3))));
                        h_xz = plot(BP(i,3),BP(i,2),'go','Parent',handles.axes3,'Tag',num2str(round(data.BP(i,1))));
                     else
                        h_branch_point = plot(BP(i,1),BP(i,2),'ro','Parent',handles.axes1,'Tag',num2str(round(data.BP(i,3))));
                        h_Max_intensity = plot(BP(i,1),BP(i,2),'ro','Parent',handles.axes2,'Tag',num2str(round(data.BP(i,3))));
                        h_xz = plot(BP(i,3),BP(i,2),'ro','Parent',handles.axes3,'Tag',num2str(round(data.BP(i,1))));
                     end
                     h_BP{length(h_BP)+1} = h_branch_point;
                     h_MI{length(h_MI)+1} = h_Max_intensity;
                     h_y{length(h_y)+1} = h_xz;
                 end
                 
                 for i = 1:length(h_BP)
                     h_BP{i}.Parent = handles.axes1;
                     h_MI{i}.Parent = handles.axes2;
                     h_y{i}.Parent = handles.axes3;
                 end

                 assignin('base','h_BP',h_BP);
                 assignin('base','h_MI',h_MI);
                 assignin('base','h_y',h_y);
                 
                 
%                 BP=evalin('base','BP');
%                 h_BP=evalin('base','h_BP');
%                 h_MI=evalin('base','h_MI');
%                 filter = {'*.m';'*.slx';'*.mat';'*.*';'*.txt'};
%                 [file, path] = uiputfile(filter);
%                 save(fullfile(path, file),'BP','h_BP','h_MI','h_y');


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    Im = evalin('base','Im');  

    xx = permute(Im,[2 3 1]);
    linkaxes([handles.axes1 handles.axes2],'xy');
    [x,y,but] = ginput(1);
    imshow(xx(:,:,round(x)), 'Parent',handles.axes3); 
    
    function axes5_CreateFcn(hObject, eventdata, handles)
