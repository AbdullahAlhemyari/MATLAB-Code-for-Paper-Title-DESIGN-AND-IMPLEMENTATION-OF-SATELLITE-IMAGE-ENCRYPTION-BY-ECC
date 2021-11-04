
function [Enc_Msg]=Encryption_1(img)
a=5376;  % A constant value selected using ECC Equation. 4*a^3+27*b^2~=0.
b=2438;  % A constant value selected using ECC Equation.
p=123457;  % A prime number
load maptab % A maping table is generated using a, b and p. i.e. (y^2)mod p=(x^3+a*x+b)mod p
disp('the original image');
figure,imshow(img);
disp('for encryption an image please enter the keys');
K=input('Enter the random key='); % Select any random Integer defined by sender
Nb=input('Enter the Private key='); % Selected Reciever's private key.
G=[2225, 75856];  % choose any one Base Point on Eliptical curve.
Pb=ptmulti_mod(G,Nb,a,p); %Public key of Reciever
EK=ptmulti_mod(Pb,K,a,p); %Encryption key
% KG=ptmulti_mod(G,K,a,p); % This key is transmitted with image for B to decrypt the image 
[rows, coln]=size(img);  % size of image.
mm=(0:255)';    % Intensity matix is used to find the number of repeatation of the particular intensity value.
encryp=[];    % encrypted image is stored.
jj=0;
hhh=waitbar(0,'Wait while encrypting the image...');
%% Encryption Process
  for i=1:rows
      for j=1:coln
          int=img(i,j);  % Intensity of pixel.
          [r,c,v]=find(mm==int);  % find the repeatation of intensity and updated .
            if v==1
                col=c(end);  % Intesity position
                if col>482    % total mapping is 482. and above which mapping is repeated again from first position.
                    mm(r(1),2:end)=0;  
                    [r,c,v]=find(mm==int);
                    col=c(end);
                end
                row=r(1);
            end
             Q=maptab(row,col+c(end):col+c(end)+1);  % ECC points for the particular pixel value mapped from the table 
             R=Ptadd_mod(Q,EK,a,p);   % point addition using encryption key.
             [r1,c1,v1]=find(maptab==R(1));
             for ii=1:length(r1)        % pixel intensity is calculated for the new point from the mapping table
                 [r2,c2,v2]=find(maptab(r1(ii),c1(ii)+1)==R(2));
                 if v2==1
                     break;
                 end
             end
             if isempty(r1)||isempty(r2)
                 ii=1;
                 r1(ii)=150;
             end
             encryp(i,j)=r1(ii)-1;  % New pixel intesity after encryption
             mm(row,col+1)=int;    % Intensity matrix is updated i.e old intensity is added here
             Enc_Msg(i,jj+1:jj+2)=R;  % Encrypted point for the original pixel value.
             jj=j*2;
      end
      waitbar(i/coln)
  end
    close(hhh)
    img2=uint8(reshape(encryp,size(img)));
   figure,imshow(img2);  
end
   

