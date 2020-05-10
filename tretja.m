
f = @(x)(1./sqrt(x + 1)) 
a = 0
b = 1
Q1 = simpson(f,a,b,1) %1 pomeni, da interval razdelimo na 1 podinterval
Q2 = simpson(f,a,b,2) %2 pomeni, da interval razdelimo na 2 podintervala (dodamo točko c)
delta = 0.0001
Q3 = adaptiv(f,a,b,delta)