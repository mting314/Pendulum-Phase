aH = axes;

c = .2; %friction/damping
freq_drive = 2.0/3.0; %driving frequency
F = 1; %max force of driver
 
y1min = 0;
y1max = 2;

y2min = 1;
y2max = 3;

y1 = linspace(y1min,y1max,20);
y2 = linspace(y2min,y2max,20);

[x,y] = meshgrid(y1,y2);
size(x);
size(y);

u = zeros(size(x));
v = zeros(size(x));

for i = 1:numel(x)
    %gets the derivative vector to plot the vector field
    Yprime = Pendulum(0,[x(i); y(i)],c,freq_drive,F);
    u(i) = Yprime(1);
    v(i) = Yprime(2);
end

%draw vector field
a = quiver(x,y,u,v,'r');


formatspec = "Driving force: %0.2f \n Friction: %0.2f \n Frequency: %0.2f";
ht = title(sprintf(formatspec,F,c,freq_drive));
xlabel('angle')
ylabel('angular velocity')
set(a,'hittest','off');

axis tight manual;

hold on; 
%when you click, the getCoord function will run, which plots the phase
%portrait given with initial condition at the coordinate you clicked at
set(aH,'ButtonDownFcn',{@getCoord,c,freq_drive,F});
uiwait