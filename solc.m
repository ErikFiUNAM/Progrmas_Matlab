%Función del robot 3D


function Fc = solc(q,xp,yp,zp)

%Parametros del robot 

b1 = 0.085; %m
a2 = 0.25; %m
a3 = 0.2875; %m

%Definir es la variable de la solución
thetha1 = q(1);
thetha2 = q(2);
thetha3 = q(3);

%Definición de la función
Fc(1) = cos(thetha1)*(a3*cos(thetha2+thetha3)-a2*sin(thetha2))-xp;
Fc(2) = sin(thetha1)*(a3*cos(thetha2+thetha3)-a2*sin(thetha2))-yp;
Fc(3) = b1+a2*cos(thetha2)+a3*sin(thetha2+thetha3)-zp;
end

