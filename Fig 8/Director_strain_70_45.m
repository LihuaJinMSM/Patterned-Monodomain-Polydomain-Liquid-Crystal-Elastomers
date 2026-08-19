% Clear cache
clearvars; close all; clc;

fileName="director_change_sim.csv";
data=readmatrix(fileName);
simOrExp = 2; % 1 for sim, 2 for exp

%% Theoretical
% Create strain axis
init_dir = 70;
strain_y = linspace(0,0.5,size(data,1));
pt_A = data(:,1)-init_dir;
pt_B = data(:,2)-init_dir;
pt_C = data(:,3)-init_dir;

%% Experimental
%% Plot angles
% Locations are the two corners and the center
angle_loc = zeros(3, 8);
error_angle = zeros(3,8);
% [center, left corner, right corner] --> top part (bottom part is
% symmetrical)
% 0%
angle_loc(:,1) = [68.4 70.9 70.3];
error_angle(:,1) = [2.4 2.7 0.6];
% 5%
angle_loc(:,2) = [67.1 73.5 73.4];
error_angle(:,2) = [3.0 2.2 1.5];
% 10%
angle_loc(:,3) = [67.3 75.7 75.5];
error_angle(:,3) = [1.6 1.9 1.3];
% 15%
angle_loc(:,4) = [68.9 76.6 76.7];
error_angle(:,4) = [0.7 1.8 0.5];
% 20%
angle_loc(:,5) = [70.1 76.9 77.1];
error_angle(:,5) = [1.2 2.0 1.4];
% 30%
angle_loc(:,6) = [72.0 77.2 78.1];
error_angle(:,6) = [3.1 1.3 1.6];
% 40%
angle_loc(:,7) = [74.1 77.5 78.6];
error_angle(:,7) = [1.3 3.3 2.2];
% 50%
angle_loc(:,8) = [78.0 78.6 78.7];
error_angle(:,8) = [1.8 1.5 1.8];

strain_axis = [0, 5, 10, 15, 20, 30, 40, 50]/100;

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
    plot(strain_y,pt_A,'Color','r','LineWidth',2);
    plot(strain_y,pt_B,'Color','b','LineWidth',2);
    plot(strain_y,pt_C,'Color','g','LineWidth',2);
    ylim([-5 14])
else
    % Experimental
    plot(strain_axis,angle_loc(1,:),'LineWidth',2,'Color','r');
    plot(strain_axis,angle_loc(2,:),'LineWidth',2,'Color','b');
    plot(strain_axis,angle_loc(3,:),'LineWidth',2,'Color','g');
    errorbar(strain_axis,angle_loc(1,:),error_angle(1,:),'Color','r');
    errorbar(strain_axis,angle_loc(2,:),error_angle(2,:),'Color','b');
    errorbar(strain_axis,angle_loc(3,:),error_angle(3,:),'Color','g');
    ylim([-5 12])
end

set(gcf,'Position', [200, 100, 750, 500]);
set(gca,'fontsize',20);