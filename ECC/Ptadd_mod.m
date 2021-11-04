function Add=Ptadd_mod(P,Q,a,p)

if P==Q
    num=(3*(P(1)^2)+a);   
    denom=(2*P(2));
    L1=modInv((denom),p); %input must be real integer so LD is round off
    slope=(mod(num*L1,p));
%     slope=num/denom;
    R(1)=mod((slope^2-2*P(1)),p);  % Addition of the point on the curve i.e. R=P+Q.
    R(2)=mod((slope*(P(1)-R(1))-P(2)),p);   % R is the point on the EC curve
    Add=R;

else
    num=(Q(2)-P(2));   
    denom=(Q(1)-P(1));
    L1=modInv((denom),p); %input must be real integer so LD is round off
    slope=(mod(num*L1,p));
%     slope=num/denom;
    R(1)= mod((slope^2-P(1)-Q(1)),p);  % Addition of the point on the curve i.e. R=P+Q.
    R(2)=mod((slope*(P(1)-R(1))-P(2)),p);   % R is the point on the EC curve
    Add=R;
end