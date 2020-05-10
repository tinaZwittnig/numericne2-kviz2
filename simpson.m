function f = simpson(f,a,b,N)
    N2 = 2 * N;
    tocke = linspace(a, b,  N2 + 1) ;
    fx = f(tocke);
    h = ((b - a) / N2); 
    sode  =  sum(fx(2:2:N2));
    lihe =  sum(fx(3:2:N2));
    f = (h/3.0) * (fx(1) + (2 * lihe) + (4 * sode) + fx(N2+1));
end