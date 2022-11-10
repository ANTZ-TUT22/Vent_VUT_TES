% The vetilation strategy is according to https://www.uptodate.com/contents/ventilator-management-strategies-for-adults-with-acute-respiratory-distress-syndrome
% Mechanical lung settings
A_lungs=0.01; %m^2 the lungs effective surface area (for mechanical purposes)
RC=0.2694;
C=5.613e-8*12; %taken from fitting lung input flow in m^3/Pa
R=RC/C;
R_respiratory=R*A_lungs^2; %  shold be in N/m/s
RC=R_respiratory*C/A_lungs^2;
E_respiratory=(1/C)*A_lungs^2 ; %* should be in N/m

% Simulated respiration lung settings
fv=15; % breaths per minute
P01=4; % In cmH2O occlusion pressure P0.1, measured 100 ms after the onset of inspiration. Range- [0.5-10] for different conditions
tauC=(10/(fv+4*P01)); %Contraction time constant
tauR=(10/(fv+P01/2)); %Relaxation time constant
Pmax=P01/(1-exp(-(0.1/tauC))); %The maximum lung pressure

% Input Gas Flow Settings
valve_restriction_air=0.2531*2; %This is to produce 30% oxygen (in combination with PEEP of 5)
valve_restriction_O2=0.2531*0.875;

% Pressure Regulation Settings
PEEP=4.5; % (cmH2O) the PEEP valve setting- taken from experiment intercept
PEEP_area_factor=0.09;   %to tune the resistivity of the PEEP flow
Popoff=13.75;% (cmH2O) the popoff valve setting- taken from experiment intercept
Popoff_area_factor=0.05; %to tune the resistivity of the Popoff flow

% Control Valve Settings
valve_opening_area=(16/2)^2*pi; %in mm^2
t_delay=0.06; %valve time delay (incuding controller etc.
IPAP=5; %minimum relay pressure (cmH2O)
EPAP=13; %maximum relay pressure (cmH2O)