function inertial_frame = rotate_frame(robot_frame, theta)


rotate = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
inertial_frame = (rotate * robot_frame);


end

