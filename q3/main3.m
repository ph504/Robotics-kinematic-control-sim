function main3(pose)



%pose = [120, 150, 0].';% start position.
targetpose = [0 0 0].';
delta_t = 0.1;
threshold = 5;
error = targetpose - pose;
err_magnitude = sqrt(error(1)^2 + error(2)^2 + error(3)^2);
pose_matrix = pose;
phi_matrix = [0; 0];
l = 5;
r = 1;
i = 1;
t = 0;
kro = 0.114202;
kalpha = 0.1;
kbeta = -0.25;
deltax = error(1);
deltay = error(2);
deltatheta = error(3);
alpha = -deltatheta + atan2(deltay, deltax);
ro = sqrt(deltax^2 + deltay^2);
while threshold<abs(ro) & i<1000
    
    deltax = error(1);
    deltay = error(2); 
    deltatheta = error(3);
    ro = sqrt(deltax^2 + deltay^2);
    alpha = -deltatheta + atan2(deltay, deltax);
    beta = -deltatheta - alpha;
    % e
    v = -kro*ro; %+ ki*sumro + kd*diffro; vx robot   
    w = -kalpha*alpha %+ kbeta*beta;

    phi1 = (v+l*w)/r;
    phi2 = (v-l*w)/r;
    phi_matrix = [phi_matrix, [phi1; phi2]];
    % u

    robot_fr = [v 0 w].';
    init_frame = rotate_frame(robot_fr, pose(3));
    pose = pose + init_frame*delta_t ;
    %pose_matrix(1:3, i) = pose;
    pose_matrix = [pose_matrix, pose];
    % update
    i = i + 1;
    t = t + delta_t;
    error = targetpose - pose;
    err_magnitude = sqrt(error(1)^2 + error(2)^2 + error(3)^2);
end

threshold = 0.03;
while threshold<abs(deltatheta) & i<2000
    
    deltax = error(1);
    deltay = error(2); 
    deltatheta = error(3);
    ro = sqrt(deltax^2 + deltay^2);
    alpha = -deltatheta + atan2(deltay, deltax);
    beta = -deltatheta - alpha;
    % e
    v = 0;%-kro*ro; %+ ki*sumro + kd*diffro; vx robot   
    w = kbeta*beta;

    phi1 = (v+l*w)/r;
    phi2 = (v-l*w)/r;
    phi_matrix = [phi_matrix, [phi1; phi2]];
    % u

    robot_fr = [v 0 w].';
    init_frame = rotate_frame(robot_fr, pose(3));
    pose = pose + init_frame*delta_t ;
    %pose_matrix(1:3, i) = pose;
    pose_matrix = [pose_matrix, pose];
    % update
    i = i + 1;
    t = t + delta_t;
    error = targetpose - pose;
    err_magnitude = sqrt(error(1)^2 + error(2)^2 + error(3)^2);
end


% elapsed time = t
interval = linspace (0, t, i);
plot(pose_matrix(1,:),pose_matrix(2,:))



end