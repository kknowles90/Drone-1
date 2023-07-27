clear;
clc;

printf('Micro UAV Silver Team\n\n')


printf('==========================\n')
printf('==========================\n\n')

printf('Propeller Equations\n')
%using den at sea level from last year in May. Roughly 1.1 kg/m3
p = 1.1;

%expected velcotiy 12 m/s -- roughly 25 mph
%Vp velocity of propeller 1500rpm, 2000 rpm, 2500 rpm in meters
%Calc from Vp = p * 2pi * (rpm/60)
printf('The following sppeds are 1500rpm,2000rpm, 2500rpm in m/s\n')
Vp = [57.4534; 76.6046; 95.7557]
%Clp is the coefficient of lift from the propeller, found online
Clp = 0.4;
%Ap is the surface area of the propeller
Ap = 0.00141332;
%Equation for Lift
printf('Equation for propeller lift force\n')
printf('Lp =  (1/2)*p*((Vp).^2)*Ap*Clp\n')
Lp =  (1/2)*p*((Vp).^2)*Ap*Clp
printf('Due to the L ratio being so high, F pushing will be choosen by ESC\n\n')

printf('F = r * Vp * Ap (Ve - V0)\n')

printf('==========================\n')
printf('==========================\n\n')

printf('UAV parameters and equations\n\n')
printf('Thrust equation F = r*Vp*A(Ve-Vo)\n')
printf('Since Vp can produce excess thrust, F\nVe and Vo will be considered unrestricted variables\n\n')

%Ar, Aspect Ratio preffered is 20-25. The wing length is 3.5 ft, 1.0668 m
Ar = 9.988;
Ws = 1.0668 * 2;
printf('Wing surface area in meter^2\n')
Aw = Ws^2 / Ar
printf('Wing chord length in meters\n')
ChordLength = Aw / Ws

%wing coefficient of lift and drag
Clw = 1.35;
Cdw = 0.01;
M1 = 10;
M2 = 11;
M3 = 12;
%ratio for Cl/Cd
Cr = Clw/Cdw;

printf('Equation for wing lift force\n')
printf('L =  (1/2)*p*((Va).^2)*Aw*Clw\n')
printf('UAV speed in m/s and corresponding lift and drag of wing\n\n')
Va = 10:25
Lw =  (1/2)*p*((Va).^2)*Aw*Clw
TotalLiftM1 = Lw - M1 * 9.81
TotalLiftM2 = Lw - M2 * 9.81
TotalLiftM3 = Lw - M3 * 9.81
Dw = (1/2)*p*((Va).^2)*Aw*Cdw

printf('From the calculations above we can depict the following\n')
printf('The takeoff speed will be roughly 5 m/s or 11 mph\n')
printf('Best climb rate will be roughly 80 meters per minute\n')
printf('Cruising speed will be 5 m/s / 11 mph and turn speed will be 11 m/s / 24mph\n')
printf('That our motor/propeller can exceed the thrust needed\n')

%printf('The plot below shows the comparisions of the speed to the lift and drag')
%plot(Va, Lw, "Lift", Va, Dw, "Drag")
%xlabel("x Airspeed")














