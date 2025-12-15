%% DESCRIPTION
%
%Script to obtain Otto Cycle
%% OUTPUT
%
%plot of Otto Cycle
%% VERSION
%       Author: Saurabh Suman
%   created: 01-04-2020
%MATLAB version: 2017b
%% PROGRAM
close all
clear
clc

%% DEFINITIONS
gamma   = 1.400;
d       = 0.1;
r_c     = 12;
l_c     = 0.15;
L       = 0.1;
R       = l_c/(L/2);

%% Initial Conditions
p1 = 100000;                    %pressure at point 1 (given)
t1 = 500;                       %temp. at point 1    (given)
t3 = 2300;                      %(given)

%% Computing

v_s = pi*d^2*L/4;               %swept volume
v_c = v_s/(r_c - 1);            %volume after compression stroke

v1 = v_s + v_c;                 %volume at point 1

v2 = v_c;                       %volume at point 2
p2 = p1 * r_c^gamma;            %pressure at point 2
t2 = p2 * v2 * t1 / (p1 * v1);  %temp. at point 2

c = p1*v1^gamma;                %p1*v1^gamma = const.
[v_comp] = Otto_Cycle_kinematics(L,d,r_c,l_c,R,180,0);
p_comp = c./(v_comp.^gamma);    %PV^gamma = const.

v3 = v2;                        %volume at point 3
p3 = p2 * t3 / t2;              %pressure at point 3

c = p3*v3^gamma;                %p1*v1^gamma = const.
v_exp = Otto_Cycle_kinematics(L,d,r_c,l_c,R,0,180);
p_exp = c./v_exp.^gamma;        %PV^gamma = const.

v4 = v1;                        %volume at point 4
p4 = p3 * (v3/v4)^gamma;        %pressure at point 4

figure(1)
hold on
plot(v1,p1,'*','color','r')     %point 1
plot(v_comp,p_comp)             %process 1-2
plot(v2,p2,'*','color','r')     %point 2
plot([v2 v3],[p2 p3])           %process 2-3
plot(v3,p3,'*','color','r')     %point 3
plot(v_exp,p_exp)               %process 3-4
plot(v4,p4,'*','color','r')     %point 4
plot([v1 v4],[p1 p4])           %process 4-1
hold off

eta = 1 - r_c^(1 - gamma)