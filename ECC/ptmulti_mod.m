function x=ptmulti_mod(P,N,a,p)

Q=P;
for i=1:N-1
x=Ptadd_mod(P,Q,a,p);
Q=x;

end