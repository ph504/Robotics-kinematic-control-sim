clear
clc

l = 10;
r = 5;

figure(1)
inverse_kinematic(10, 0, 0, l, r, 0)

figure(2)
inverse_kinematic(0, 0, 10, l, r, 0)