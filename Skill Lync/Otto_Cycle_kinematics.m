function[v] = Otto_Cycle_kinematics(L,d,r_c,l_c,R,initial,final)

theta = linspace(initial, final, 360);

v_s = pi*d^2*L/4;               %swept volume
v_c = v_s/(r_c - 1);            %volume after compression stroke
term1 = 0.5.*(r_c - 1);
term2 = R + 1 - cosd(theta);
term3 = R^2 - sind(theta);

v = (1 + term1*(term2 - term3.^0.5)).*v_c;    %piston kinematics equation
end