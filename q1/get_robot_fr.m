function robot_vector = get_robot_fr(phi1, phi2, l, r)
    robot_vector = [r*(phi1+phi2)/2, 0, r*(phi1-phi2)/(2*l)].';
end