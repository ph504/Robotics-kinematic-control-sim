clear
clc

omega = pi/4;
rotaion_matrix = [cos(omega) sin(omega) ; -sin(omega) cos(omega)];

start_point = [60 0].';

for i=1:8
    
    figure(i)
    main3([start_point;0])
    start_point = rotaion_matrix * start_point
    
end







