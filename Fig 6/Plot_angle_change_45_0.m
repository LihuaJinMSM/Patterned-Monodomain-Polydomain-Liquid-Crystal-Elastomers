% Clear cache
clearvars; close all; clc;

fileName="Angle_change.csv";
data=readmatrix(fileName);
simOrExp = 1; % 1 = sim, 2 = exp

%% Theoretical
% Create strain axis
strain_y = linspace(0,0.5,size(data,1));
pt_A = data(:,1)-45;
pt_B = data(:,2)-45;
pt_C = data(:,3)-45;

%% Experimental
%% Plot angles
% Locations are the two corners and the center
angle_loc = zeros(3, 6);
error_angle = zeros(3,6);
% [center, left corner, right corner] --> top part (bottom part is
% symmetrical)
% 0%
angle_loc(:,1) = [49.47 44.47 47.64];
error_angle(:,1) = [1.41 1.98 1.18];
% 10%
angle_loc(:,2) = [60.19 39.78 59.95];
error_angle(:,2) = [1.54 1.45 1.62];
% 20%
angle_loc(:,3) = [73.23 38.35 62.38];
error_angle(:,3) = [1.54 1.57 1.54];
% 30%
angle_loc(:,4) = [81.27 40.18 68.96];
error_angle(:,4) = [1.26 1.50 0.89];
% 40%
angle_loc(:,5) = [95.46 43.25 76.02];
error_angle(:,5) = [1.24 0.40 1.15];
% 50%
angle_loc(:,6) = [99.80 60.59 78.92];
error_angle(:,6) = [1.99 1.73 1.35];

strain_axis = [0, 10, 20, 30, 40, 50]/100;

% delta theta
angle_loc(1,:) = angle_loc(1,:)-angle_loc(1,1);
angle_loc(2,:) = angle_loc(2,:)-angle_loc(2,1);
angle_loc(3,:) = angle_loc(3,:)-angle_loc(3,1);

% Plot
figure(1)
hold on
grid on
if simOrExp == 1
    % Theoretical
    plot(strain_y,pt_A,'Color','b','LineWidth',2);
    plot(strain_y,pt_B,'Color','r','LineWidth',2);
    plot(strain_y,pt_C,'Color','g','LineWidth',2);
else
    % Experimental
    plot(strain_axis,angle_loc(1,:),'Color','b','LineWidth',2);
    plot(strain_axis,angle_loc(2,:),'Color','r','LineWidth',2);
    plot(strain_axis,angle_loc(3,:),'Color','g','LineWidth',2);
    errorbar(strain_axis,angle_loc(1,:),error_angle(1,:),'Color','b');
    errorbar(strain_axis,angle_loc(2,:),error_angle(2,:),'Color','r');
    errorbar(strain_axis,angle_loc(3,:),error_angle(3,:),'Color','g');
end
%legend('A','B','C',Location='eastoutside');

%ylabel('Director angle (deg)');
xlabel('$\epsilon_{yy}$','Interpreter','latex')
ylabel('$\Delta\theta (^o)$','Interpreter','latex');
%title('Simulation for angle vs strain')
set(gcf,'Position', [200, 100, 750, 500]);
set(gca,'fontsize',20);