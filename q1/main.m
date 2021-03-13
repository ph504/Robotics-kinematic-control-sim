clear
clc

%phi1 = 100;
%phi2 = 100;
%t_start = 0;
%t_end = 20;
%delta_t = 1;


figure(1)
direct_kinematic(100, 100, 0, 20, 0.1);

figure(2)
direct_kinematic(-100, 100, 0, 20, 0.1);

figure(3)
direct_kinematic(0, 100, 0, 20, 0.1);

figure(4)
direct_kinematic(10, 20, 0, 20, 0.1);



