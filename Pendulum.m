function dY = Pendulum(t,Y,c,freq_drive,F)
%PENDULUM Summary of this function goes here
%   Detailed explanation goes here
dY = zeros(2,1);
dY(1) = Y(2);
dY(2) = -sin(Y(1))-c*Y(2)+F*cos(freq_drive*t);
end

