function direct_kinematic(phi1, phi2, t_start, t_end, delta_t)
%phi1 = 100;
%phi2 = 100;
%phi1 = phi1 * pi/180;
%phi2 = phi2 * pi/180;
%t_start = 0;
%t_end = 20;
%delta_t = 0.1;

interval = t_start : delta_t : t_end ;
invs = (t_end - t_start)/delta_t + 1;

pose = [0 0 0].';
robot_fr = get_robot_fr(phi1, phi2, 10, 5);


pose_matrix = zeros(3, invs);
i = 1;
for t = interval
    init_frame = rotate_frame(robot_fr, pose(3));
    pose = pose + init_frame*delta_t ;
    pose_matrix(1:3, i) = pose;
    i = i + 1;
end

subplot(2,2,1);
plot(interval, pose_matrix(1,1:invs))
xlabel("time");
ylabel("x");
subplot(2,2,2);
plot(interval, pose_matrix(2,1:invs))
xlabel("time");
ylabel("y");
subplot(2,2,[3,4]);
plot(pose_matrix(1,1:invs), pose_matrix(2,1:invs))
xlabel("x");
ylabel("y");

end

