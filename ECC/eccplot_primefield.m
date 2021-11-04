% This script is used to generate the set of all possible ECC points on the
% ECC curve.
clear all
close all
clc
p=523967;   % Prime number is selected
a=-6;     % constants a and b that satisfy the eq 4*a^3+27*b^2~=0.
b=3;
i=1;
%eccpoints=[];
%for x=0:p
    %for y=0:p
     %   if mod(y^2,p)==mod((x^3+a*x+b),p)  % This equation must be satisfied by x and y for the given value of a, b and p.
           % eccpoints(i,:)=[x y];
    %        i=i+1;
   %     else
  %      end
 %   end
%end
load eccpoints.mat
eccpoints_all=[eccpoints; 0 0; 0 0;0 0;0 0;0 0]; 
N=1;
ii=1;
for j=1:2:1624
    for i=N:1:N+255
    x=eccpoints_all(i,:);  % The above points are arranged to map the intensity of pixels of the image. 
    maptab(ii,j:j+1)=x;    %
     ii=ii+1;
    end
    ii=1;
    N=N+256;
end
x=(0:255)';
maptab=[x maptab];
save maptab maptab
 %load eccpoints_all.mat
 %x=eccpoints_all(1:100,1);
 %y=eccpoints_all(1:1000,2);
 %x=linspace(-3,3,200);
 %plot(x,y,'ro','MarkerFaceColor','g','MarkerSize',10)
% 
%xlim([1 p]);
 %ylim([1 p]);
 %set(gca,'XTick',0:length(x))
 %set(gca,'YTick',0:length(x))
 %grid on;



