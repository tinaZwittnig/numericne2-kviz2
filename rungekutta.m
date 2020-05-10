function y = rungekutta(x,f,y0)
% Opis:
%  Funkcija rk4 vrne numericno resitev navadne diferencialne enacbe
%  y' = f(x,y) pri pogoju y(x(1)) = y0, ki je izracunana s runge kutta
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
    k2 = f(x(n-1)+h(n-1)/3, y(n-1)+h(n-1)*k1/3);
    k3 = f(x(n-1)+h(n-1).* 2/3, y(n-1)+h(n-1)*(k2-k1/3));
    k4 = f(x(n-1)+h(n-1).*1, y(n-1)+h(n-1)*(k3-k2+k1));
    y(n) = y(n-1) + h(n-1)*(k1/8 + 3/8.*k2 + 3/8*k3 + 1/8.* k4);
end

end