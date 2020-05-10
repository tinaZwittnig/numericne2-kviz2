function fx = adaptiv(f,a,b,delta)
A1 = simpson(f, a,b, 1);
A2 = simpson(f,a,b, 2);
napaka =(A2-A1)/15;
if abs(napaka) <= delta
  fx = A2+napaka;
else 
  fx = adaptiv(f,a,(a+b)/2, delta/2) + adaptiv(f,(a+b)/2, b, delta/2);
end
end