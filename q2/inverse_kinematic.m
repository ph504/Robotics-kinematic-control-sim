function inverse_kinematic(vx, vy, w, l, r, theta)

    inertial_frame = [vx vy w].';
    theta = theta*pi/180;


    t_start = 0;
    t_end = 20;
    delta_t = 1;
    interval = t_start : delta_t : t_end ;
    invs = (t_end - t_start)/delta_t + 1;
    phi_vector = [0, 0].';


    phi_matrix = zeros(2, invs);
    pose = [0, 0, 0].';

    i = 1;
    for t = interval
        robot_fr = rotate_frame(inertial_frame, theta);
        phi1 = (robot_fr(1)+l*robot_fr(3))/r;
        phi2 = (robot_fr(1)-l*robot_fr(3))/r;

        %init_frame = rotate_frame(robot_fr, pose(3));
        pose = pose + inertial_frame*delta_t;
        phi_vector = [phi1, phi2];
        phi_matrix(:, i) = phi_vector;
        i = i + 1;
    end

    subplot(1,2,1);
    plot(interval, phi_matrix(1,1:invs))
    xlabel("time");
    ylabel("phi1");
    subplot(1,2,2);
    plot(interval, phi_matrix(2,1:invs))
    xlabel("time");
    ylabel("phi2");
    

end