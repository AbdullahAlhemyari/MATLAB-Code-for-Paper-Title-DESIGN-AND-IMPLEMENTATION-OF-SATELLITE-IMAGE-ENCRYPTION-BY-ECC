function Add=Ptadd_Ec(P,Q,a)

if P==Q
    num=(3*(P(1)^2)+a);   
    denom=(2*P(2));
    slope=num/denom;
    R(1)=slope^2-2*P(1);  % Addition of the point on the curve i.e. R=P+Q.
    R(2)=slope*(P(1)-R(1))-P(2);   % R is the point on the EC curve
    Add=R;

else
    num=(Q(2)-P(2));   
    denom=(Q(1)-P(1));
    slope=num/denom;
    R(1)=slope^2-P(1)-Q(1);  % Addition of the point on the curve i.e. R=P+Q.
    R(2)=slope*(P(1)-R(1))-P(2);   % R is the point on the EC curve
    Add=R;
end