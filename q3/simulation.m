clear
close
clc

omega = pi/4;
rotaion_matrix = [cos(omega) sin(omega) ; -sin(omega) cos(omega)];

start_point = [5 0].';
figure(1)
hold on
matrix = [];
for i=1:8
    
    %figure(i)
    
    main3([0,0,0].',[start_point;0]);
    start_point = rotaion_matrix * start_point;    
    grid on
    
end
legend('1','2','3','4','5','6','7','8');
hold off





