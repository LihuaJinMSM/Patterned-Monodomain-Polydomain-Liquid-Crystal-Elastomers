% Clear cache
clearvars; clc; close all;

% 45
width=3;
length=15;
thickness=0.12;
cross_area=width*thickness;
results_45=xlsread('45.xlsx');
time_45=results_45(3:end,1);
strain_45=results_45(3:end,2)/length;
for i=1:size(strain_45)
    stress_45(i)=results_45(i+2,3)/cross_area/3;
end
n2 = 100;             % Number of elements to create the mean over
s2 = size(strain_45);      % Find the next smaller multiple of n
m2  = s2 - mod(s2, n2);
strain_45_smooth  = reshape(strain_45(1:m2), n2, []);     % Reshape x to a [n, m/n] matrix
strain_45_smooth = transpose(sum(strain_45_smooth, 1) / n2); % the averaged vector
stress_45_smooth  = reshape(stress_45(1:m2), n2, []);     % Reshape x to a [n, m/n] matrix
stress_45_smooth = transpose(sum(stress_45_smooth, 1) / n2); % the averaged vector
for i=1:147
 modulus_45_smooth(i)=(stress_45_smooth(i+5)-stress_45_smooth(i))/...
     (strain_45_smooth(i+5)-strain_45_smooth(i));
end

% Polydomain
length=15; %mm
cross_area = 0.35*15; % m^2
polyFileName = 'poly_cured.csv';
results_poly = readmatrix(polyFileName);
strain_poly=results_poly(4:end,2)/length;
stress_poly = results_poly(4:end,3)/cross_area;

n2 = 50;
s2 = size(strain_poly);
m2 = s2-mod(s2,n2);
strain_poly_smooth  = reshape(strain_poly(1:m2), n2, []);     % Reshape x to a [n, m/n] matrix
strain_poly_smooth = transpose(sum(strain_poly_smooth, 1) / n2); % the averaged vector
stress_poly_smooth  = reshape(stress_poly(1:m2), n2, []);     % Reshape x to a [n, m/n] matrix
stress_poly_smooth = transpose(sum(stress_poly_smooth, 1) / n2); % the averaged vector

% 90
length=20; %mm
cross_area = 0.21*6.5; % m^2 
FileName90 = 'MONO.csv';
results_90 = readmatrix(FileName90);

strain_90 = results_90(4:end,2)/length;
stress_90 = results_90(4:end,3)/cross_area;

n2 = 50;
s2 = size(strain_90);
m2 = s2-mod(s2,n2);
strain_90_smooth  = reshape(strain_90(1:m2), n2, []);     % Reshape x to a [n, m/n] matrix
strain_90_smooth = transpose(sum(strain_90_smooth, 1) / n2); % the averaged vector
stress_90_smooth  = reshape(stress_90(1:m2), n2, []);     % Reshape x to a [n, m/n] matrix
stress_90_smooth = transpose(sum(stress_90_smooth, 1) / n2); % the averaged vector

% 45
length=12; %mm
cross_area = 0.19*5; % m^2 
FileName45m = '45 mono.csv';
results_45_mono = readmatrix(FileName45m);

strain_45_mono = results_45_mono(4:end,2)/length;
stress_45_mono = results_45_mono(4:end,3)/cross_area;

n2 = 50;
s2 = size(strain_45_mono);
m2 = s2-mod(s2,n2);
strain_45m_smooth  = reshape(strain_45_mono(1:m2), n2, []);     % Reshape x to a [n, m/n] matrix
strain_45m_smooth = transpose(sum(strain_45m_smooth, 1) / n2); % the averaged vector
stress_45m_smooth  = reshape(stress_45_mono(1:m2), n2, []);     % Reshape x to a [n, m/n] matrix
stress_45m_smooth = transpose(sum(stress_45m_smooth, 1) / n2); % the averaged vector

% 45-FEA
length=20; %mm
cross_area = 0.2*5; % m^2 
FileName45 = '45_FEA.xlsx';
results_45F = readmatrix(FileName45);

fac45 = 0.004;
stress_45F = fac45*results_45F(:,2);
strain_45F = linspace(0,1.5,size(stress_45F,1));

n2 = 50;
s2 = size(strain_45F);
m2 = s2-mod(s2,n2);
strain_45F_smooth  = reshape(strain_45F(1:m2), n2, []);     % Reshape x to a [n, m/n] matrix
strain_45F_smooth = transpose(sum(strain_45F_smooth, 1) / n2); % the averaged vector
stress_45F_smooth  = reshape(stress_45F(1:m2), n2, []);     % Reshape x to a [n, m/n] matrix
stress_45F_smooth = transpose(sum(stress_45F_smooth, 1) / n2); % the averaged vector

% mono_sim
fac1=7.5;
FileNameMS = 'mono_sim.xlsx';
results_MS = readmatrix(FileNameMS);

%strain_MS = results_MS(:,1);

tstress_MS = fac1*results_MS(:,2)/3e6;
strain_MS = linspace(0,1.5,size(tstress_MS,1));

stress_MS = tstress_MS./(1+strain_MS);


n2 = 50;
s2 = size(strain_MS);
m2 = s2-mod(s2,n2);
strain_MS_smooth  = reshape(strain_MS(1:m2), n2, []);     % Reshape x to a [n, m/n] matrix
strain_MS_smooth = transpose(sum(strain_MS_smooth, 1) / n2); % the averaged vector
stress_MS_smooth  = reshape(stress_MS(1:m2), n2, []);     % Reshape x to a [n, m/n] matrix
stress_MS_smooth = transpose(sum(stress_MS_smooth, 1) / n2); % the averaged vector

% poly_sim
fac2=7.5;
FileNamePS = 'poly_sim2.xlsx';
results_PS = readmatrix(FileNamePS);

strain_PS = exp(results_PS(:,1))-1;
tstress_PS = fac2*results_PS(:,2)/28;%/3e6;
stress_PS = tstress_PS./(1+strain_PS);
%strain_PS = linspace(0,1.5,size(stress_PS,1));

n2 = 50;
s2 = size(strain_PS);
m2 = s2-mod(s2,n2);
strain_PS_smooth  = reshape(strain_PS(1:m2), n2, []);     % Reshape x to a [n, m/n] matrix
strain_PS_smooth = transpose(sum(strain_PS_smooth, 1) / n2); % the averaged vector
stress_PS_smooth  = reshape(stress_PS(1:m2), n2, []);     % Reshape x to a [n, m/n] matrix
stress_PS_smooth = transpose(sum(stress_PS_smooth, 1) / n2); % the averaged vector

% 45_0
crossArea = 0.20e-3*5e-3;
data45_0 = readmatrix("45_90_1.csv");
stress_45_0_exp = data45_0(:,3) ./ crossArea / 1e6; % in MPa
strain_45_0_exp = data45_0(:,2) ./ 20;

n2 = 1800;
s2 = size(strain_45_0_exp);
m2 = s2-mod(s2,n2);
strain_45_0_exp_sm  = reshape(strain_45_0_exp(1:m2), n2, []);     % Reshape x to a [n, m/n] matrix
strain_45_0_exp_sm = transpose(sum(strain_45_0_exp_sm, 1) / n2); % the averaged vector
stress_45_0_exp_sm  = reshape(stress_45_0_exp(1:m2), n2, []);     % Reshape x to a [n, m/n] matrix
stress_45_0_exp_sm = transpose(sum(stress_45_0_exp_sm, 1) / n2); % the averaged vector

% Pattern cases
results_pattern = readmatrix('Pattern_SS_FEA.xlsx');

strain_45_0 = results_pattern(:,1)*0.5;
strain_110_45 = results_pattern(:,6)*0.5;

width2D = 5;
facP = 1e5/5.5;
stress_45_0 = results_pattern(:,2)*facP/(width2D/10)/1e6*1;
stress_70_45 = results_pattern(:,4)/width2D/1e6*1;
stress_110_45 = results_pattern(:,5)/width2D/1e6*1;
stress_90_45 = results_pattern(:,7)/width2D/1e6*1;

figure(1)
hold on

plot(strain_90_smooth(1:70:end),stress_90_smooth(1:70:end),'bo','linewidth',2);
n1 = floor(size(strain_45_smooth,1)*0.7);
plot(strain_MS(1:350),stress_MS(1:350),'-','Color','b','linewidth',3);
p3=plot(strain_45_smooth(1:10:n1),stress_45_smooth(1:10:n1),'o','Color',"k",'linewidth',2);
plot(strain_45F,stress_45F,'k-','linewidth',3);
plot(strain_poly_smooth(1:70:end),stress_poly_smooth(1:70:end),'ro','linewidth',2);
plot(strain_PS,stress_PS,'-','Color','r','linewidth',3);
plot(strain_45_0_exp_sm, stress_45_0_exp_sm,'go', 'linewidth',2);
plot(strain_45_0, stress_45_0,'g-', 'linewidth',3);

% xlabel('\itε_{yy}')
% ylabel('\itS_{yy} \rm(MPa)');
set(gca,'fontsize',24);
set(gca,'FontName','Arial');
xlim([0, 1.5]);
ylim([0, 1]);
%lgd=legend('\theta_0=90°','\theta_0=60°','\theta_0=45°','\theta_0=30°','Polydomain','mono','45 mono');
lgd=legend('\itθ_0\rm=90° (Experiment)','\itθ_0\rm=90° (FEA)','\itθ_0\rm=45° (Experiment)','\itθ_0\rm=45° (FEA)','Polydomain (Experiment)',...
    'Polydomain (FEA)', '\itθ_0\rm=45°, φ=0° (Experiment)','\itθ_0\rm=45°, \itφ\rm=0° (FEA)','Location','northeast');
set(lgd,'fontsize',18);
%set(lgd,'FontName','Times New Roman');
set(gcf, 'Position', [200, 50, 950, 700]);

figure(2)
hold on
plot(strain_45_0, stress_45_0,'g-', 'linewidth',3);
plot(strain_45_0, stress_70_45,'-','Color','#FCC42B', 'linewidth',3);
plot(strain_110_45, stress_110_45,'-', 'Color','#FF38DB', 'linewidth',3);
plot(strain_45_0, stress_90_45,'-', 'Color','#00D6D6', 'linewidth',3);
plot(strain_MS(1:350),stress_MS(1:350),'-','Color','b','linewidth',3);
plot(strain_45F,stress_45F,'k-','linewidth',3);
% xlabel('\itε_{yy}')
% ylabel('\itS_{yy} \rm(MPa)');
set(gca,'fontsize',24);
set(gca,'FontName','Arial');
xlim([0, 0.5]);
ylim([0, 0.2]);
%lgd=legend('\theta_0=90°','\theta_0=60°','\theta_0=45°','\theta_0=30°','Polydomain','mono','45 mono');
lgd=legend('\itθ_0\rm=45°, \itφ\rm=0°','\itθ_0\rm=70°, \itφ\rm=45°','\itθ_0\rm=110°, \itφ\rm=45°','\itθ_0\rm=90°, \itφ\rm=45°',...
    '\itθ_0\rm=90°','\itθ_0\rm=45°','Location','northeast');
set(lgd,'fontsize',18);
% set(lgd,'FontName','Times New Roman');
set(gcf, 'Position', [200, 50, 950, 700]);