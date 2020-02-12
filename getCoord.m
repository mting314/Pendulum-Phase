function getCoord(aH,evnt,c,freq_drive,F)
drawnow
f = ancestor(aH,'figure');
click_type = get(f,'SelectionType');
ptH = getappdata(aH,'CurrentPoint');
delete(ptH)
if strcmp(click_type,'normal')
    pt = get(aH,'CurrentPoint'); %Getting click position
    ptH = plot(aH,pt(1),pt(3),'k*','MarkerSize',5);
    
    set(ptH,'hittest','off'); % so you can click on the Markers
    
    [ts,ys] = ode45(@(t,Y) Pendulum(t,Y,c,freq_drive,F),[0,50], [pt(1) pt(3)]);
    [bts,bys] = ode45(@(t,Y) Pendulum(t,Y,c,freq_drive,F),[0,-50], [pt(1) pt(3)]);
    w=plot(aH,ys(:,1),ys(:,2),'b');
    q=plot(aH,bys(:,1),bys(:,2),'b');
    set(q,'hittest','off');
    set(w,'hittest','off');
    setappdata(aH,'CurrentPoint',ptH);
elseif strcmp(click_type,'alt')
    %do your stuff once your point is selected   
    disp('Done clicking!');
    % HERE IS WHERE YOU CAN PUT YOUR STUFF
    uiresume(f);
end