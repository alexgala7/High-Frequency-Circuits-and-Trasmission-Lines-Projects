function G = Circ2(z0,fn) 
f0=1e9; 
l=0.125*fn/f0; 
z1=z0; 
z2=CalcZin(inf,l,98.45); 
z3=1/(1/z1+1/z2); 
z4=CalcZin(z3,l,101.6); 
z5=CalcZin(inf,l,43.6); 
z6=1/(1/z4+1/z5); 
z7=CalcZin(z6,l,101.6); 
z8=CalcZin(inf,l,98.45); 
zin=1/(1/z7+1/z8); 
G=(zin-50)/(zin+50); 
G=abs(G); 
end
