img=imread('ex1.png');
I=rgb2gray(img);
title('gray level image without histigram'); 
figure,imshow(I);


%% PREPROCESSING---ENHANCEMENT %%%
% HE = histeq(I);
HE = double(histeq(uint8(I)));
figure,imshow(HE,[]);
title('Histogram Equalized Image'); 
%impixelinfo;
imsizeinfo;