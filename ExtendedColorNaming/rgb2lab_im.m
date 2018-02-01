function [L,A,B]=rgb2lab_im(RGB)
%we assume white is D65
[X,Y,Z] = srgb2xyz_im(RGB);
[L,A,B] = xyz2lab_im(X,Y,Z);

%mask=(L>5);
%A=A.*mask;
%B=B.*mask;
