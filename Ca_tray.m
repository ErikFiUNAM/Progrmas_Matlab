% Cálculo de las configuraciones durante la trayectoria

waprox = [pi/6 -pi/4 -pi/4];

for i=1:length(x_tray)
    
qc(i,:) = fsolve(@(q) F_postura2(q,x_tray(i),y_tray(i),z_tray(i)),waprox); 
    
theta1_cal(i) = qc(i,1);
theta2_cal(i) = qc(i,2);
theta3_cal(i) = qc(i,3);

waprox = [theta1_cal(i) theta2_cal(i) theta2_cal(i)];

end

%Condicionamiento de la señal del actuador

theta1_con = transpose(theta1_cal);
theta2_con = transpose(theta2_cal);
theta3_con = transpose(theta3_cal);

%Creación de las señales

%Definición del tiempo de simulación

t_muestreo = 0.1; %seg
t_total = 10; %seg
t_sim = 0:t_muestreo:t_total;
t = transpose(t_sim); 


signal_theta1 = [t theta1_con];
signal_theta2 = [t theta2_con];
signal_theta3 = [t theta3_con];


