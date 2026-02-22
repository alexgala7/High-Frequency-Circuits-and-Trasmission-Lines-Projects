function G = Circ1(z0,fn) 
f0=5e9; 
zl = 20 - 1i * 30; 
l2=0.366*fn/f0; 
z1=CalcZin(Inf,l2,z0);
za=1/(1/zl+1/z1);
d=0.125 * fn/f0; 
zb=CalcZin(za,d,z0); 
l1=0.458*fn/f0; 
z2=CalcZin(Inf,l1,z0); 
zin=1/(1/z2+1/zb);
G=(zin-z0)/(zin+z0); 
G=abs(G); 
end
