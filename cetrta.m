 f = @(x,y) 1 + (x-y).^2;
x = 3:1/10:4;
y1=1;
resitev2 = rungekutta(x,f,y1);
y4 = resitev2(end)
resitev = rk4(x,f,y1)
resitev(end)

h = @(z)pomocRungekutta(x,f,z,5) %zadnji argument, kaj hočemo v drugi točki intervala

y3 = fzero(@(x)h(x),1)

