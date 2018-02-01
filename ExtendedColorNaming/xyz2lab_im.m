function [L,A,B] = xyz2lab_im(X,Y,Z)

% function [lab] = xyz2lab(xyz,obs,xyzw)
% computes CIELAB LAB values from XYZ tristimulus values
% requires the illuminant/observer obs to define white point
% see function r2xyz for valid values for obs
% 5th April 2004 - typo corrected for d50_31
% 5th August 2004 - optional argument for user-defined XYZ white point
% use obs = 'user' to invoke this option
% 1st December 2004 - F9 corrected to read F11
% 10th December 2004 - Xn for ill A (1931) corrected to 109.850


%elseif strcmp('d55_31', obs)
%    white=[95.682 100.00 92.149];
%elseif strcmp('d65_64', obs)   

   white=[94.811 100.00 107.304];  %white is D65
    
   mask=(Y/white(2) > 0.008856);
   L = mask.*(116*(Y/white(2)).^(1/3) - 16)+(~mask.*903.3.*(Y/white(2)));
   
   mask=(L/white(1) > 0.008856);
   fx1 = mask.*(X/white(1)).^(1/3)+(~mask).*( 7.787.*(X/white(1)) + 16/116);
   
   mask=(Y/white(2) > 0.008856);
   fx2 = mask.*(Y/white(2)).^(1/3)+(~mask).*( 7.787.*(Y/white(2)) + 16/116);
   
   mask=(Z/white(3) > 0.008856);
   fx3 = mask.*(Z/white(3)).^(1/3)+(~mask).*( 7.787.*(Z/white(3)) + 16/116);
   
   A = 500*(fx1-fx2);
   B = 200*(fx2-fx3);











