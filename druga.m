
f = @(x)exp(-2.*x)+ cos(5.*x);
j = [-1:1:21]
h = 1/20
xj = j*h
x = xj(2:end-1)
S1 = zeros(1,length(x))
S2 = zeros(1,length(x))

for i = 2:length(xj)-1
    xj(i+1)
    S1(i-1) = (f(xj(i+1))-f(xj(i-1)))./(2*h) %prvi odvod
    S2(i-1) = (f(xj(i-1)) -2.*f(xj(i)) + (f(xj(i+1))))/(h^2) %drugi odvod
end

df = -2.* exp(-2.* x) - 5.* sin(5.* x)%prvi odvod
ddf = 4.* exp(-2.* x) - 25.* cos(5.* x)%drugi odvod

plot(x,df,x,S1)
hold on
plot(x,ddf,x,S2)

norm1 = norm(df-S1,'inf')
norm2 = norm(ddf-S2,'inf')