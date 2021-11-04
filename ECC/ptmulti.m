function x=ptmulti(P,N,a)

Q=P;
for i=1:N-1
x=Ptadd_Ec(P,Q,a);
Q=x;

end