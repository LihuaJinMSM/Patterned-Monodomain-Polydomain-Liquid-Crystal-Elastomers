%% Plot resulting plots for director
% Formating the plot for director results
% clear cache
clearvars; close all; clc;

% Load files
strain_perc = string(0); % 0 ~ 50 with increment of 10
% File location
fileName = strcat("Director_45_0_",strain_perc,".mat");
load(fileName);

% Set up parameters for the plot
level = linspace(30,90,7);
m=length(level)-1;
x_axis = 1:size(theta,2);
y_axis = 1:size(theta,1);

% Plotting
figure (1)
hold on
[X,Y] = meshgrid(x_axis,y_axis);
contourf(X,Y,theta,level,'LineStyle','none');
set(gca,'YTickLabel',[]);
set(gca,'XTickLabel',[]);
c = jet(m);
c = [0 0 1;...  % blue
    0 1 1;...  % cyan
    0 1 0;...  % green
    1 1 0;...  % yellow
    1 191/255 0;... % orange
    1 0 0]; % red
colormap(c);
axis equal;
cbar = colorbar('Ticks',level,'Location','westoutside');
set(cbar,'position',[.3 .4 .06 .25])
cbar.Label.String = "Director (°)";
clim([level(1) level(length(level))]);
titleName = strcat({' '},strain_perc,'%');

title(titleName,'FontSize',16);
drawnow