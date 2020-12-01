%%%Definción de la función de la postura del robot de los eslabones 1 y 3

function sol = F_postura(theta)

%Parametros del robot 

b1 = 0.085; %m
a2 = 0.25; %m
a3 = 0.2875; %m

%%Pose inicial
%xin = 0.10; %m
%yin = 0.20; %m
%zin = 0.0; %m

%pose final
xfin = 0.20; %m
yfin = -0.20; %m
zfin = 0.30; %m

sol(1) = cos(theta(1))*(a3*cos(theta(2)+theta(3))-a2*sin(theta(2)))-xfin;
sol(2) = sin(theta(1))*(a3*cos(theta(2)+theta(3))-a2*sin(theta(2)))-yfin;
sol(3) = b1+a2*cos(theta(1))+a3*sin(theta(2)+theta(3))-zfin;
end





