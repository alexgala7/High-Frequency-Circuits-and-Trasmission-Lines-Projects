function zin = CalcZin(zl,l,z0) 
if isinf(zl) 
 zin=-1i*z0*cot(2*pi*l); 
else
 zin=z0*(zl+1i*z0*tan(2*pi*l))/(z0+1i*zl*tan(2*pi*l)); 
end
