function [X,Y,Z] = srgb2xyz_im(RGB)

% function [XYZ] = srgb2xyz(RGB)
% converts 8-bit sRGB to CIE XYZ
% RGB is a 3 by 1 matrix containing the RGB values (0-255)
% from colour toolbox
 
M = [3.2410 -1.5374 -0.4986; -0.9692 1.8760 0.0416; 0.0556 -0.2040 1.0570];
RGB = RGB/255;
RGB = ((RGB+0.055)/1.055).^(2.4);

HH=size(RGB,1);
WW=size(RGB,2);
NP=HH*WW;

XYZ = inv(M)*[reshape(RGB(:,:,1),1,NP);reshape(RGB(:,:,2),1,NP);reshape(RGB(:,:,3),1,NP)];
XYZ = XYZ*80;

X=reshape(XYZ(1,:),HH,WW);
Y=reshape(XYZ(2,:),HH,WW);
Z=reshape(XYZ(3,:),HH,WW);