function main3(pose, targetpose)

%targetpose = [0 0 0].';
delta_t = 0.025;
threshold = 0.1;
error = targetpose - pose;

pose_matrix = pose;
phi_matrix = [0; 0];
l = 10;
r = 1;
i = 1;
t = 0;

kro = 3;
kalpha = 8;
kbeta = -1.5;

deltax = error(1);
deltay = error(2);
deltatheta = error(3);
alpha = -deltatheta + atan2(deltay, deltax);
beta = -deltatheta - alpha;
ro = sqrt(deltax^2 + deltay^2);

    
plot(pose(1),pose(2),'p','LineWidth',2,'MarkerSize',16,...
    'MarkerEdgeColor','k','MarkerFaceColor','b')

while threshold<abs(ro) & i<2000
    
    deltax = error(1);
    deltay = error(2);
    deltatheta = error(3);
    ro = sqrt(deltax^2 + deltay^2);
    alpha = -deltatheta + atan2(deltay, deltax);
    beta = -deltatheta - alpha;
%     alpha = sign(alpha)*mod(abs(alpha), pi);
%     beta = sign(beta)*mod(abs(beta), pi);
    
    v = kro*ro; 
    w = kalpha*alpha + kbeta*beta;

    phi1 = (v+l*w)/r;
    phi2 = (v-l*w)/r;
    phi_matrix = [phi_matrix, [phi1; phi2]];


    robot_fr = [v 0 w].';
    init_frame = rotate_frame(robot_fr, pose(3));

    pose = pose + init_frame*delta_t ;

    
    
    pose(3) = sign(pose(3))*mod(abs(pose(3)), 2*pi);
    
    
    pose_matrix = [pose_matrix, pose];
    
    i = i + 1;
    t = t + delta_t;
    error = targetpose - pose;
    
    plot(pose_matrix(1,:),pose_matrix(2,:))
%     pause(1);
    
end

threshold = 0.1;
while threshold<abs(deltatheta) & i<3000
    
    deltax = error(1);
    deltay = error(2);
    deltatheta = error(3);
    ro = sqrt(deltax^2 + deltay^2);
    alpha = -deltatheta + atan2(deltay, deltax);
    beta = -deltatheta - alpha;
%     alpha = sign(alpha)*mod(abs(alpha), pi);
%     beta = sign(beta)*mod(abs(beta), pi);
    
    v = 0;%kro*ro; 
    w = kalpha*alpha + kbeta*beta;

    phi1 = (v+l*w)/r;
    phi2 = (v-l*w)/r;
    phi_matrix = [phi_matrix, [phi1; phi2]];


    robot_fr = [v 0 w].';
    init_frame = rotate_frame(robot_fr, pose(3));

    pose = pose + init_frame*delta_t ;

    
    
    pose(3) = sign(pose(3))*mod(abs(pose(3)), 2*pi);
    
    
    pose_matrix = [pose_matrix, pose];
    
    i = i + 1;
    t = t + delta_t;
    error = targetpose - pose;
    
    plot(pose_matrix(1,:),pose_matrix(2,:))
%     pause(1);
    
end

pause(1)




end
