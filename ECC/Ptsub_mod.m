function Sub=Ptsub_mod(P,Q,a,p)


Q(2)=-Q(2);
if P==Q
    num=(3*(P(1)^2)+a);   
    denom=(2*P(2));
    L1=modInv((denom),p); 
    slope=(mod(num*L1,p));

    R(1)=slope^2-2*P(1);  % Subtraction of the point on the curve i.e. R=P+(-Q).
    R(2)=slope*(P(1)-R(1))-P(2);   % R is the point on the EC curve
    Sub=R;

else
    num=(Q(2)-P(2));   
    denom=(Q(1)-P(1));
    L1=modInv((denom),p); 
    slope=(mod(num*L1,p));

    R(1)=mod(slope^2-P(1)-Q(1),p);  % Subtraction of the point on the curve i.e. R=P-Q.
    R(2)=mod(slope*(P(1)-R(1))-P(2),p);   % R is the point on the EC curve
    Sub=R;
end