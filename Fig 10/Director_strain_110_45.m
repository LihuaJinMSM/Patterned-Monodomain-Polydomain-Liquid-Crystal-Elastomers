% Clear cache
clearvars; close all; clc;

fileName="Director_vs_strain.csv";
data=readmatrix(fileName);
simOrExp = 1; % 1 for sim, 2 for exp

%% Theoretical
% Create strain axis
init_dir = 110;
strain_y = linspace(0,0.5,size(data,1));
pt_A = data(:,2)-init_dir;
pt_B = data(:,3)-init_dir;
pt_C = data(:,4)-init_dir;

%% Experimental
%% Plot angles
% Locations are the two corners and the center
angle_loc = zeros(3, 8);
error_angle = zeros(3,8);
% [center, left corner, right corner] --> top part (bottom part is
% symmetrical)
% 0%
angle_loc(:,1) = [109.1 114.4 113.8];
error_angle(:,1) = [2.6 4.5 1.9];
% 5%
angle_loc(:,2) = [108.1 112.4 110.6];
error_angle(:,2) = [0.7 1.3 0.5];
% 10%
angle_loc(:,3) = [106.6 108.3 108.6];
error_angle(:,3) = [2.0 4.7 2.0];
% 15%
angle_loc(:,4) = [106.7 107.0 106.5];
error_angle(:,4) = [1.7 3.5 1.1];
% 20%
angle_loc(:,5) = [106.7 106.6 106.1];
error_angle(:,5) = [2.1 1.9 2.0];
% 25%
angle_loc(:,6) = [106.9 105.0 105.1];
error_angle(:,6) = [3.9 3.9 2.6];
% 30%
angle_loc(:,7) = [105.7 102.5 103.7];
error_angle(:,7) = [2.2 3.8 1.6];
% 40%
angle_loc(:,8) = [105.3 100.6 102.2];
error_angle(:,8) = [1.8 3.4 1.6];
% 50%
angle_loc(:,9) = [103.4 97.4 99.6];
error_angle(:,9) = [1.8 4.8 1.3];

strain_axis = [0, 5, 10, 15, 20, 25, 30, 40, 50]/100;

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
    plot(strain_y,pt_A,'LineWidth',2,'Color','r');
    plot(strain_y,pt_B,'LineWidth',2,'Color','b');
    plot(strain_y,pt_C,'LineWidth',2,'Color','g');
    ylim([-14 4])
else
    % Experimental
    plot(strain_axis,angle_loc(1,:),'LineWidth',2,'Color','r');
    plot(strain_axis,angle_loc(2,:),'LineWidth',2,'Color','b');
    plot(strain_axis,angle_loc(3,:),'LineWidth',2,'Color','g');
    errorbar(strain_axis,angle_loc(1,:),error_angle(1,:),'Color','r');
    errorbar(strain_axis,angle_loc(2,:),error_angle(2,:),'Color','b');
    errorbar(strain_axis,angle_loc(3,:),error_angle(3,:),'Color','g');
    ylim([-20 10])
end
xlabel('$\epsilon_{yy}$','Interpreter','latex')
ylabel('$\Delta\theta (^o)$','Interpreter','latex');
set(gcf,'Position', [200, 100, 750, 500]);
set(gca,'fontsize',20);
