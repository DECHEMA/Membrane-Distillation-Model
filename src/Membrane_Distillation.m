%% Paper: Highly Saline Water Desalination Using Direct Contact Membrane Distillation (DCMD):
% Experimental and Simulation Study

%% Input System patrameters 

T_mf = 100+ 273;                             % feed mean temperature K
T_mp = 25 + 273;                             % permeate mean temperature K
R_g = 8.314;                                 % universal gas constant J/mol.K
M_wt =  18;                                  % total molecular weight of the water particle g/mol
X_wf = 0.965;                                % water mole fraction in the feed water
X_Nacl = 0.035;                              % Nacl mole fraction in the feed water
P = 151325;                                  % P is the total pressure inside the pore (assumed to be constant and equal to the summation of the partial pressures of air and water)
Inlet_flow = 5;                              % kg/sec
rho_l = 1000;                                % Density of liquid in hot channel                                  
mu = 0.001002;                               % viscosity of the fluid
C_bf = 35;                                   % concentration of feed bulk kg/m3
n = 20 ;                                     % Number of modules
T_amb = 20+273;                              % Ambient Temperature K
C_p = 4180 ;                                 % Specific heat J/kg.K
T_drop = 20 ;                                % Temperature drop K

%% Membrane properties

d_por = 0.22e-6;                             % Diameter of pore m
delta = 96e-6;                               % membrane thickness m
epsilon = 0.78;                              % membrane porosity m
tau = ((2-epsilon)^2)/epsilon;               % membrane tortuosity
SR = 0.9998;                                 % salt rejection rate

%% Design_Parameters 

Diameter_of_Module = 0.5;                         % m
L = 4;                                            % channel length m
CS_area =  ((pi/4)*(Diameter_of_Module^2));       % hot channel Cross_sectional_area for hydrolic diameter m2
wetted_peremeter = 2*pi*(Diameter_of_Module/2)*L; % hot channel wetted_peremeter for hydrolic diameter m2
u = (Inlet_flow/1000)/CS_area;                    % Velocity of liquid in hot channel m/s

%% Partial Pressure calculations

T_m = ((T_mf+T_mp)/2);                       % mean temperature 
PD_WA = 1.895e-5 * (T_m^2.072);              % total pressure inside the pore * diffusion coefficent of air eq9
Pi = tau * delta;                            % membrane tortuosity
a_wf = 1 - (0.5*X_Nacl) -10*(X_Nacl^2) ;     % water activity coefficent
P_mf =exp(23.1964-(3816.44/(T_mf-46.13)));   % 
p_mf = P_mf* X_wf *a_wf;                     % eq6 partial pressure of water at the feed side
P_mp = exp(23.1964-(3816.44/(T_mp-46.13)));  % eq6 partial pressure of water at the permeate side

%% Diffusion coeffcient calculations

D_K =(((3*Pi)/(2*epsilon*d_por))*((pi*R_g*T_m)/((8*M_wt)))^0.5)^-1 ;  % eq7 Knudson diffusion coefficient
D_M = ((R_g*T_m*P*Pi)/(M_wt*epsilon*PD_WA))^-1;                       % eq8 Molecular diffusion coefficient
alphaa = D_K/D_M;                                                     % ratio of knudson diffusion to molecular diffusion (ranges 0-1)
D_e = ((alphaa/D_K)+((1-alphaa)/D_M))^-1;                             % eq7 Equivalent diffusion coefficent

%% Mass flux ;
% The mass flux in DCMD is proportional to the vapor pressure gradient through the membrane and can be given by the following equation
% Permeat flow and concentration

J = D_e*(p_mf-P_mp);                                        % eq1 Permeate mass flux g/m2.s
J_o = D_e *(p_mf - P_mp) *3.6;                              % eq1 Permeate mass flux kg/m2.h
Permeat_out = (J_o*wetted_peremeter*n)/3600;                % permeate outlet kg/sec 
Permeat_conc = (1-SR)*35;                                   % permeat concentration with salt rejection rate

%%  Polarization coefficent calculation  

D_h = (4*CS_area)/wetted_peremeter;                    % Hydrolic diameter
Re = (rho_l * u * D_h)/mu;                             % Reynolds number
Sc = mu / (rho_l * D_e);                               % Schmidt number
Sh = 1.86 * (Re * Sc * ((D_h / L)^(1 / 3)));           % Scherwood number
k_s =(Sh * D_e) / D_h ;                                % solute mass transfer coeffcient
C_mf = C_bf*exp(J/(k_s*rho_l));                        % Concnetration of solute at the membrane surface
POL_COEFF = C_mf/C_bf;                                 % Polarization coefficient

%% Brine flow & Cocentrations calculation

brine_out = Inlet_flow-Permeat_out;                                                  % brine outlet kg/sec 
brine_concentration = ((Inlet_flow*35)-(Permeat_conc*Permeat_out))/brine_out;        % brine concentration computation

%% Power requirment calculations

T_lev = T_mf-T_drop;                                           % Brine leaving Temperature
T_mem = 60+273;                                                % Temperature on the membrane side
Q_feed = (Inlet_flow * C_p * (T_mf - T_amb))/1000;             % Heat supply to heat the feed flow to T_mf in KWatts
Q_leaving_feed = (brine_out * C_p * (T_lev - T_amb))/1000;     % Heat leaving with Brine Outlet_flow: T_lev in KWatts
Q_Permeate = (Permeat_out * C_p * (T_mem - T_mp))/1000;        % Cooling of Permeat flow in KWattts
