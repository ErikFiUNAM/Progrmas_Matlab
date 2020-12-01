%%%Definción de la función de la postura del robot de los eslabones 1 y 3


function sol1 = F_postura2(q,x_tray,y_tray,z_tray)

theta1=q(1);
theta2=q(2);
theta3=q(3);

%Parametros del robot 

b1 = 0.085; %m
a2 = 0.25; %m
a3 = 0.2875; %m

sol1(1) = cos(theta1)*(a3*cos(theta2+theta3)-a2*sin(theta2))-x_tray;
sol1(2) = sin(theta1)*(a3*cos(theta2+theta3)-a2*sin(theta2))-y_tray;
sol1(3) = b1+a2*cos(theta1)+a3*sin(theta2+theta3)-z_tray;
end

