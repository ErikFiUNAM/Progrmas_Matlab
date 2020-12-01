% Generación de la trayectoria

%%%%%Parámetros de la trayectoria

%pose inicial
xin = 0.10; %m
yin = 0.20; %m
zin = 0.0; %m

%pose final
xfin = 0.10; %m
yfin = -0.20; %m
zfin = 0.15; %m

%Definición del tiempo de simulación
t_muestreo = 0.1; %seg
t_total = 10; %seg
t_sim = 0:t_muestreo:t_total;

%Cálculo de la trayecoria

x_tray = xin+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(xfin-xin);
y_tray = yin+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(yfin-yin);
z_tray = zin+((10/t_total^3)*t_sim.^3-(15/t_total^4)*t_sim.^4+(6/t_total^5)*t_sim.^5)*(zfin-zin);

plot3(x_tray,y_tray,z_tray);
grid on

%Condicionamiento de las señales de entrada

t = transpose(t_sim); 


x_tray_t = transpose(x_tray);
y_tray_t = transpose(y_tray);
z_tray_t = transpose(z_tray);


signal_xp = [t x_tray_t];
signal_yp = [t y_tray_t];
signal_zp = [t z_tray_t];
