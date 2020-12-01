%%%Programa para mover un robot 3R en 3D

%Parametros del srobot 

b1 = 0.085; %m
a2 = 0.25; %m
a3 = 0.2875; %m

%Definición la postura inicial

xin = 0.10; %m
yin = 0.20; %m
zin = 0; %m

%Definición la postura final

xfin = 0.10; %m
yfin = -0.20; %m
zfin = 0.15; %m


%Cálculo de la posturas

%Definición de las funciones postura inicial

xrf_in = @(theta1_in,theta2_in,theta3_in) cos(theta1_in)*(a3*cos(theta2_in+theta3_in)-a2*sin(theta2_in))-xin;
yrf_in = @(theta1_in,theta2_in,theta3_in) sin(theta1_in)*(a3*cos(theta2_in+theta3_in)-a2*sin(theta2_in))-yin;
zrf_in = @(theta1_in,theta2_in,theta3_in) b1+a2*cos(theta2_in)+a3*sin(theta2_in+theta3_in)-zin;

%función postura
postura_in = @(w) [xrf_in(w(1),w(2),w(3));yrf_in(w(1),w(2),w(3));zrf_in(w(1),w(2),w(3))];

%Aproximaión postura inicial
w0 = [0.5 -0.1 0.1];

Postura_1 = fsolve(postura_in,w0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Definición de las funciones postura inicial

xrf_fin = @(theta1_fin,theta2_fin,theta3_fin) cos(theta1_fin)*(a3*cos(theta2_fin+theta3_fin)-a2*sin(theta2_fin))-xfin;
yrf_fin = @(theta1_fin,theta2_fin,theta3_fin) sin(theta1_fin)*(a3*cos(theta2_fin+theta3_fin)-a2*sin(theta2_fin))-yfin;
zrf_fin = @(theta1_fin,theta2_fin,theta3_fin) b1+a2*cos(theta2_fin)+a3*sin(theta2_fin+theta3_fin)-zfin;

%función postura
postura_fin = @(w1) [xrf_fin(w1(1),w1(2),w1(3));yrf_fin(w1(1),w1(2),w1(3));zrf_fin(w1(1),w1(2),w1(3))];

%Aproximaión postura final
wf = [-0.5 -0.5 0.15];

Postura_2 = fsolve(postura_fin,wf);



%%%%%%%%%Simulación numerica del robot %%%%%%%%%%%%%%%%%

%Duración del tiempo de simulación 

T = 10; %seg tiempor total de la tarea
muestreo = 20;
intiempo = 10/muestreo;


for i = 1:1:muestreo+1
    
t = intiempo*(i-1); %Se toma en cuenta 0 como inicio de la acción

%Comportamiento de las juntas
theta1sim = 1.10715+((10/T^3)*t^3-(15/T^4)*t^4+(6/T^5)*t^5)*(-1.10715-1.10715);
theta2sim = -0.678367+((10/T^3)*t^3-(15/T^4)*t^4+(6/T^5)*t^5)*(-0.0140605-(-0.678367));
theta3sim = -0.658202+((10/T^3)*t^3-(15/T^4)*t^4+(6/T^5)*t^5)*(-pi/2-(-0.658202));
  
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

