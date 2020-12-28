function dY = Pendulum(t,Y,c,freq_drive,F)
%PENDULUM Summary of this function goes here
%   Detailed explanation goes here

a = -2;
dY = zeros(2,1);
%dY(1) = Y(2);
dY(1) = Y(1)*(a-4+2*Y(2))-a;
%dY(2) = -sin(Y(1))-c*Y(2)+F*cos(freq_drive*t);
dY(2) = Y(2)*(a+1-Y(1))-2*a;

end

