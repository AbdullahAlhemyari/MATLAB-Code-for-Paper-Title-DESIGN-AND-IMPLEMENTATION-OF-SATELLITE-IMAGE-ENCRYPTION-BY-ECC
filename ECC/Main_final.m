%this code is used to encrypt and decrypt the satellite image useng ECC 
clear all 
close all
clc
rgbimage=rgb2gray(imread('ex2.jpg'));  % load any image 
disp('please enter the size resolution for satellite image');
x=input('enter 1(100X100),2(150X150), 3(200x200), 4(256x256), 5(400x400) =');
if x==1
img= imresize(rgbimage,[100 100]);
else if x==2
      img= imresize(rgbimage,[150 150]);
    else if x==3
            img= imresize(rgbimage,[200 200]);
            
     else if x==4
            img= imresize(rgbimage,[256 256]);
       
     else if x==5
            img= imresize(rgbimage,[400 400]);
            end
         end
        end
    end
end
tstart=tic;
[Enc_Msg]=Encryption_1(img);    % This is process for encryption and output argument is havinag the set 
                                % off point for each pixel which are map  ped at
time_enc=toc(tstart);                              % the ECC curve.
tstartd=tic;
Decryption_1(Enc_Msg)% This is the decryption process which recieve the ECC points as input
                        % and decryption key is generated and subtracted
                        % from all these points one by one. Again mapping
                        % is used to get the original image pixel.
time_dec=toc(tstartd);