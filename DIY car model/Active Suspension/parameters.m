clear all
x = input('Enter value 1.Quarter Car model 2.Half Car model:');
if x==1
    
    ms=250;
    mu=50;
    k=16812;
    kt=190000;
    c=1000;
    
elseif x==2
    
    a=0.675; %front trackwidth (m.)
    b=0.6; %rear trackwidth (m.)
    J=48.96; %moment of inertia for pitch(line running left to right)
    mu_f=25; %unsprung mass front
    mu_r=30; %unsprung mass rear
    ms=105; %sprung mass
    k1=190000; %front tyre stiffness (N/m)
    k2=190000; %rear tyre stiffness (N/m)
    k3=16000; %front spring stiffness (N/m)
    k4=24000; %rear spring stiffness (N/m)
    b1=3000; %front damping (N/m)
    b2=3000; %rear damping (N/m)
    v=20; %vehicle speed (kmph)
    L=1.475; %wheelbase (m.)
    td=L/(v*5/18); %time delay bump hitting front and rear (sec.)
end