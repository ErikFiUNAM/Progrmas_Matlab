%Soluciones de la postura

waprox = [pi/6 -pi/4 -pi/4];

for i=1:length(xp)

q_cal(i,:) = fsolve(@(q) solc(q,xp(i),yp(i),zp(i)),waprox);

thetha1_cal(i) = q_cal(i,1);
thetha2_cal(i) = q_cal(i,2);
thetha3_cal(i) = q_cal(i,3);

waprox = [q_cal(i,1) q_cal(i,2) q_cal(i,3)];

end

%Condicionamiento de la señal del actuador

theta1_con = transpose(-thetha1_cal);
theta2_con = transpose(-thetha2_cal);
theta3_con = transpose(-thetha3_cal);

%Creación de las señales

%Definición del tiempo de simulación
t_muestreo = 0.1; %seg
t_total = 10; %seg
t_sim = 0:t_muestreo:t_total;
t = transpose(t_sim); 

signal_thetha1 = [t theta1_con];
signal_thetha2 = [t theta2_con];
signal_thetha3 = [t theta3_con];
