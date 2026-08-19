% Clear Cache
clearvars; clc; close all;

% File location and name

fileName = "Exy_ref.xlsx";
% For Exx, Exy, Eyy_ref, adjust limit accordingly
% data from DIC, y axis downward
strain=readmatrix(fileName);
if fileName == "Exy_ref.xlsx"
    strain=-strain;
end
strain(strain==0)=NaN;

x_coor=length(strain(1,:));
y_coor=length(strain(:,1));
x_axis=1:x_coor;
y_axis=y_coor:-1:1;

pixel_mm=0.043492/2;

level = -0.01:0.11;
[X,Y] = meshgrid(x_axis,y_axis);
x_pixel_size=480;
y_pixel_size=270;
pixel_mm_image_x=pixel_mm*x_coor/x_pixel_size;
pixel_mm_image_y=pixel_mm*y_coor/y_pixel_size;
X1 = [pixel_mm_image_x, x_pixel_size*pixel_mm_image_x];
Y1 = [pixel_mm_image_y, y_pixel_size*pixel_mm_image_y]; 
figure

colormap(jet(7));
hold on; 
axis equal
img=imread('first.jpg');

imagesc(X1,Y1,flipud(img)); 

[c,cont]=contourf(X*pixel_mm,Y*pixel_mm,strain,'LineStyle','none');
cbar = colorbar;

xlim([4.5 5.25])
ylim([0.25 3])
title('E_{xy}')
cbar.Label.String = "Strain";
clim([0 0.5])

set(gca,'fontsize',20);
set(gca,'XTick',[])
set(gca,'YTick',[])