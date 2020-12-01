%%%Programa para mover un robot 3R en 3D

%Parametros del srobot 

b1 = 0.085; %m
a2 = 0.25; %m
a3 = 0.2875; %m

%Definición la postura inicial

xin = 0.35; %m
yin = 0.20; %m
zin = 0; %m

%Definición la postura final

xfin = 0.35; %m
yfin = -0.20; %m
zfin = 0.15; %m


%Cálculo de la posturas
%Definición de las variables

syms theta1_in theta2_in theta3_in theta1_fin theta2_fin theta3_fin



%Cálculo de la postura inicial
[theta1_in,theta2_in,theta3_in] = fsolve(cos(theta1_in)*(a3*cos(theta2_in+theta3_in)-a2*sin(theta2_in))==xin,sin(theta1_in)*(a3*cos(theta2_in+theta3_in)-a2*sin(theta2_in))==yin,b1+a2*cos(theta2_in)+a3*sin(theta2_in+theta3_in)==zin,[theta1_in,theta2_in,theta3_in]);

%Cálculo de la postura final
[theta1_fin,theta2_fin,theta3_fin] = fsolve(cos(theta1_fin)*(a3*cos(theta2_fin+theta3_fin)-a2*sin(theta2_fin))==xfin,sin(theta1_fin)*(a3*cos(theta2_fin+theta3_fin)-a2*sin(theta2_fin))==yfin,b1+a2*cos(theta2_fin)+a3*sin(theta2_fin+theta3_fin)==zfin,[theta1_fin,theta2_fin,theta3_fin]);


%%%%%%%%%Simulación numerica del robot %%%%%%%%%%%%%%%%%

%Duración del tiempo de simulación 

T = 10; %seg tiempor total de la tarea
muestreo = 20;
intiempo = 10/muestreo;


for i = 1:1:muestreo+1
    
t = intiempo*(i-1); %Se toma en cuenta 0 como inicio de la acción

%Comportamiento de las juntas
theta1sim = theta1_in+((10/T^3)*t^3-(15/T^4)*t^4+(6/T^5)*t^5)*(theta1_fin-theta1_in);
theta2sim = theta2_in+((10/T^3)*t^3-(15/T^4)*t^4+(6/T^5)*t^5)*(theta2_fin-theta2_in);
theta3sim = theta3_in+((10/T^3)*t^3-(15/T^4)*t^4+(6/T^5)*t^5)*(theta3_fin-theta3_in);
  
%Definición del primer eslabón
x1L = 0;
y1L = 0;
z1L = b1;

%Definición del segundo eslabón
x2L = -a2*cos(theta1sim)*sin(theta2sim);
y2L = -a2*sin(theta1sim)*sin(theta2sim);
z2L = b1+a2*cos(theta2sim);

%Definición del tercer eslabón
x3L = cos(theta1sim)*(a3*cos(theta2sim+theta3sim)-a2*sin(theta2sim));
y3L = sin(theta1sim)*(a3*cos(theta2sim+theta3sim)-a2*sin(theta2sim));
z3L = b1+a2*cos(theta2sim)+a3*sin(theta2sim+theta3sim);


%figure


quiver3(0,0,0,x1L,y1L,z1L,'Color','red','LineStyle','-')

quiver3(x1L,y1L,z1L,x2L,y2L,z2L,'Color','green','LineStyle','-')
hold on
quiver3(x2L,y2L,z2L,x3L,y3L,z3L,'Color','blue','LineStyle','-')

F = getframe;

end

movie(F)


