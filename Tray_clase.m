%Trayecoria

%%%%%Parámetros de la trayectoria

%pose inicial
xin = 0.10; %m
yin = 0.20; %m
zin = 0.15; %m

%pose final
xfin = 0.10; %m
yfin = -0.20; %m
zfin = 0.20; %m

%Arreglo del tiempo

t_total = 10; %s
t_muestreo = 0.1; %s
t_sim = 0:t_muestreo:t_total;

%Trayectoria

xp = xin+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(xfin-xin);
yp = xin+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(yfin-yin);
zp = xin+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(zfin-zin);

plot3(xp,yp,zp)
grid on

%Arreglo de la señal de salida

t = transpose(t_sim);
xp_t = transpose(xp);
yp_t = transpose(yp);
zp_t = transpose(zp);

signal_xp = [t xp_t];
signal_yp = [t yp_t];
signal_zp = [t zp_t];


