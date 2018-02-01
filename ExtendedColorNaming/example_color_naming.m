
% load the word to color names matrix. The words are a 42*42*20 grid on the LAB space. 

% 11 color names
load('./mapping_matrices/w2c11.mat');
w2c=w2cBLall;
selected=[1,2,3,4,5,6,7,8,9,10,11];

% 25 color names
% load('./mapping_matrices/w2c25.mat');
% w2c_ex=w2cBLall;
% selected_ex=[1,2,3,4,5,6,7,8,9,10,11,29,37,39,19,16,18,26,14,25,33,38,12,17,22];%% order index of the first 25 color names

% 39 color names
load('./mapping_matrices/w2c39.mat');
w2c_ex=w2cBLall;
selected_ex=[1,2,3,4,5,6,7,8,9,10,11,29,37,39,19,16,18,26,14,25,33,38,12,17,22,15,36,20,34,21,35,31,32,23,28,30,24,13,27]; %% order index of the first 39 color names

% first example
im=double(imread('opp_color_circle.tif'));       % load test image

% compute the color name assignment for all pixels in image im:
out=im2cLAB2_test(im,w2c,-1,selected);
out=im2uint8(out);

out_ex=im2cLAB2_test(im,w2c_ex,-1,selected_ex);
out_ex=im2uint8(out_ex);

figure(1);
subplot(1,3,1);imshow(uint8(im));
subplot(1,3,2);imshow(uint8(out));
subplot(1,3,3);imshow(uint8(out_ex));

% second example:  
im2=double(imread('test3.jpg')); 
% im2=double(imread('painting.jpg'));

out2=im2cLAB2_test(im2,w2c,-1,selected);
out2=im2uint8(out2);

out_ex2=im2cLAB2_test(im2,w2c_ex,-1,selected_ex);
out_ex2=im2uint8(out_ex2);

figure(2);
subplot(1,3,1);imshow(uint8(im2));
subplot(1,3,2);imshow(uint8(out2));
subplot(1,3,3);imshow(uint8(out_ex2));