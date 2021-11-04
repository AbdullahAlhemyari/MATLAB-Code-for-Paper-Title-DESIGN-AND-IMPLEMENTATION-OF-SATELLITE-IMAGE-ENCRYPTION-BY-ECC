function xInv = modInv(x,n)
% ModInv(x,n) computes the multiplicative inverse of x modulo n if one
% exists; errors if no such inverse exists
if gcd(x,n) ~= 1
%    error('x has no inverse modulo n')
    x=x-1;
end

[d, a]   = gcd(double(x),n);
xInv        = mod(a,n);
end
