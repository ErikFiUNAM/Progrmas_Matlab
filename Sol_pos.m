%Cálculo de la solución de la postura


%pose inicial
xin = 0.10; %m
yin = 0.20; %m
zin = 0.0; %m

%pose final
xfin = 0.10; %m
yfin = -0.20; %m
zfin = 0.15; %m

%%%%%%%Cálculo de postura inicial%%%%

%qaprox_in = [pi/6,-pi/4,-pi/4]; %%Para la posición inicial
%qin = fsolve(@F_postura,qaprox_in);

%%%%%%%%%%%%%%

qaprox_fin = [-pi/3,-pi/4,-pi/3]; %%Para la posición inicial
qfin = fsolve(@F_postura,qaprox_fin);


