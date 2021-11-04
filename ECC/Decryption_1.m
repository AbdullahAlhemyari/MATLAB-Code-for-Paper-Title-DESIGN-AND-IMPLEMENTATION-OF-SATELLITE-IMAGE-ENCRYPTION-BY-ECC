% This script is used to decrypt the image.
function Decryption_1(Enc_Msg)
a=5376;
% b=2438;
p=123457;
load maptab
disp('please enter the keys for decryption pross');
K=input('Enter the random key='); % Select any random Integer defined by sender
Nb=input('Enter the Private key='); % Selected Reciever's private key.
G=[2225, 75856];  % choose any one Base Point on Eliptical curve.
Pb=ptmulti_mod(G,Nb,a,p); %Public key of Reciever
% KG=ptmulti_mod(G,K,a,p); % This key is transmitted with image for B to decrypt the image 
DK=ptmulti_mod(Pb,K,a,p); %Decryption key
[rows, coln]=size(Enc_Msg);
decryp=[];
cnt=1;
hhh=waitbar(0,'Wait while Decrypting the image...');
%% Decryption Process
  for i=1:rows
      for j=1:2:coln
             Q=Enc_Msg(i,j:j+1);
             R=Ptsub_mod(Q,DK,a,p);   % Decryption key is subtracted from point.
             [r1,c1,v1]=find(maptab==R(1));   % Resulting points are used to calculate the corresponding pixel intesity
             for ii=1:length(r1)
                 [r2,c2,v2]=find(maptab(r1(ii),c1(ii)+1)==R(2));
                 if v2==1
                     break;
                 end
             end
             if isempty(r1)||isempty(r2)  % if pints are not in the table, adefault value is assigned to the pixel.
                 ii=1;
                 r1(ii)=150;
             end
             decryp(i,cnt)=r1(ii)-1;   % Decrypted image vector
             cnt=cnt+1;
      end
      cnt=1;
       waitbar(i/coln)
  end
   close(hhh)
   Img=uint8(reshape(decryp,[rows coln/2]));
   disp('the recavring image')
   figure,imshow(Img);
   
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %with image enhancement using histagram equalization
   
I=Img;
figure,imshow(I);
title('gray level image without histigram'); 


%% PREPROCESSING---ENHANCEMENT %%%
% HE = histeq(I);
HE = double(histeq(uint8(I)));
figure,imshow(HE,[]);
title('Histogram Equalized Image'); 

end
     
 