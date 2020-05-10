function y = rk4(x,f,y0)
% Opis:
%  Funkcija rk4 vrne numericno resitev navadne diferencialne enacbe
%  y' = f(x,y) pri pogoju y(x(1)) = y0, ki je izracunana s klasicno
%  Runge-Kutta metodo reda 4.
%
% Definicija:
%  y = rk4(x,f,y0)
%
% Vhod:
%  x    vrstica delilnih tock,
%  f    funkcija f v obliki @(x,y) f(x,y),
%  y0   zacetna vrednost resitve.
%
% Izhod:
%  y    vrstica numericnih priblizkov za vrednosti tocne resitve v delilnih
%       tockah.

m = length(x) - 1;
h = diff(x);
y = [y0 zeros(1,m)];
for n = 2:m+1
    k1 = f(x(n-1), y(n-1));
    k2 = f(x(n-1)+h(n-1)/2, y(n-1)+h(n-1)*k1/2);
    k3 = f(x(n-1)+h(n-1)/2, y(n-1)+h(n-1)*k2/2);
    k4 = f(x(n-1)+h(n-1), y(n-1)+h(n-1)*k3);
    y(n) = y(n-1) + h(n-1)*(k1 + 2*k2 + 2*k3 + k4)/6;
end

end