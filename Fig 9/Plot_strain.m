% Clear Cache
clearvars; clc; close all;

% File location and name
fileAddress = "Exy.xlsx";
% data from DIC, y axis downward
strain=readmatrix(fileAddress);
if fileAddress == "Exy.xlsx"
    strain=-strain;
end
strain(strain==0)=NaN;

x_coor=length(strain(1,:));
y_coor=length(strain(:,1));
x_axis=1:x_coor;
y_axis=y_coor:-1:1;
% x_coor * y_coor is DIC resolution
pixel_mm=0.027507; %for 70_45 0.029325 for 45_0

level = -0.01:0.11;
[X,Y] = meshgrid(x_axis,y_axis);
% image resolution is 5472*3072
x_pixel_size=480;
y_pixel_size=270;
pixel_mm_image_x=pixel_mm*x_coor/x_pixel_size;
pixel_mm_image_y=pixel_mm*y_coor/y_pixel_size;
X1 = [pixel_mm_image_x, x_pixel_size*pixel_mm_image_x];
Y1 = [pixel_mm_image_y, y_pixel_size*pixel_mm_image_y]; 
figure

%level = linspace(-0.6,0,7);
colormap(jet(7));
cbar = colorbar;
%cfig = figure('Position', [100, 100, 1400, 800]); 
hold on; 
axis equal
img=imread('first.jpg');
%imagesc([-100 100],[-100 100],A); 
%hold on
imagesc(X1,Y1,flipud(img)); 
%hold on;
%h=imshow(img,'XData',X1,'YData',Y1);
[c,cont]=contourf(X*pixel_mm,Y*pixel_mm,strain,'LineStyle','none');
%set(gca,'YTickLabel',[]);
%set(gca,'XTickLabel',[]);
%axis equal;
%contP=get(cont,'Parent');
ylim([0 4.8])
xlim([5.7 7.3])
title('E_{xy}')
set(gca, 'Ytick', 0:5:20); 
set(gca, 'xtick', 0:5:20); 
% xlabel('Width (mm)');
% ylabel('Length (mm)');
set(gca,'fontsize',20);
% set image transparent 
%h.AlphaData = .2; 

% crack tip(13.33,11.86)
%crack length 5