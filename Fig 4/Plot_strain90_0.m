% Clear Cache
clearvars; clc; close all;

fileAddress = "Exx.xlsx";
% Options are Exx, Exy, and Eyy
% data from DIC, y axis downward
strain=readmatrix(fileAddress);
if fileAddress == "Exy.xlsx"
    strain= -strain;
end
strain(strain==0)=NaN;

x_coor=length(strain(1,:));
y_coor=length(strain(:,1));
x_axis=1:x_coor;
y_axis=y_coor:-1:1;

pixel_mm=0.029683; 

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


colormap(jet(7));
cbar = colorbar;
hold on; 
axis equal
img=imread('first.jpg');

imagesc(X1,Y1,flipud(img)); 

[c,cont]=contourf(X*pixel_mm,Y*pixel_mm,strain,'LineStyle','none');

ylim([1 5])
xlim([6.7 8.7])

set(gca, 'Ytick', 0:5:20); 
set(gca, 'xtick', 0:5:20); 

set(gca,'fontsize',20);