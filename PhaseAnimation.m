c = .3; %friction/damping
freq_drive = 2.0/3.0; %driving frequency
F = 1.7; %max force of driver
 
y1min = -2;
y1max = 20;

y2min = -2;
y2max = 4;

y1 = linspace(y1min,y1max,20);
y2 = linspace(y2min,y2max,20);

T = linspace(1,6,300);
figure('Renderer', 'painters', 'Position', [10 10 900 600])
for id = 1:length(T)
    F = T(id)-1;
    
    [x,y] = meshgrid(y1,y2);
    size(x);
    size(y);

    u = zeros(size(x));
    v = zeros(size(x));

    t=0;
    for i = 1:numel(x)
        Yprime = Pendulum(t,[x(i); y(i)],c,freq_drive,F);
        u(i) = Yprime(1);
        v(i) = Yprime(2);
    end


    subplot(2,1,1);
    quiver(x,y,u,v,'r');
    xlabel('angle')
    ylabel('angular velocity')
    axis tight equal;
    axis([y1min y1max y2min y2max])

    hold on
    for y0 = [0 0.5 1 1.5 2 3 4 5]
        [ts,ys] = ode45(@(t,Y)Pendulum(t,Y,c,freq_drive,F),[0,50],[0;y0]);
        plot(ys(:,1),ys(:,2))
        plot(ys(1,1),ys(1,2),'bo') % starting point
        plot(ys(end,1),ys(end,2),'ks') % ending point
    end

    hold off
    
    %Plot of particular a particular trajectory (starting with a particular initial condition)%
    subplot(2,1,2);
    [ts,ys] = ode45(@(t,Y)Pendulum(t,Y,c,freq_drive,F),[0,100],[0;1]);
    plot(ts,ys(:,1), 'Color', 'b')
    xlabel('time')
    ylabel('angle')
    formatspec = "Driving force: %0.2f \n Friction: %0.2f \n Frequency: %0.2f";
    ht = title(sprintf(formatspec,F,c,freq_drive));
    drawnow;
    %pause(.3)
end
