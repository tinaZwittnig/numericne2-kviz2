% skripta narise dvakrat zvezno odvedljiv kubicen zlepek Bezierjevih
% krivulj glede na uporabnikov vnos

% parametri delitve
ALFA = linspace(0,1,5);
L = length(ALFA);

j = [0:1:10]'.*2/10.*pi;
P= [j.*cos(j), j.*sin(j)];
dp =@(x)[ cos(x) - x *sin(x), x*cos(x) + sin(x)];


v = 0;
for j = 2:11
    v = v + 1/4 *norm(P(j,:)-P(j-1,:));
end

C = jet(L);
H = zeros(1,L);
D = cell(1,L);
for l = 1:L
    alfa = ALFA(l);
    
    % izracunamo zlepek
    u = zeros(1,m);
    for i = 2:m
        u(i) = u(i-1) + norm(P(i,:)-P(i-1,:))^alfa;
    end
    B = kubbezzlepek(u,P,dp(0)/norm(dp(0)),dp(2*pi)/norm(dp(2*pi)));
    
    
    % izrisemo krivulje
    t = linspace(0,1);
    for i = 1:m-1
        if v< u(i) && v>u(i-1)
            t2 = (v-u(i-1))/(u(i)-u(i-1));
            alfa
            b2 = B(1,:,i-1)*bernstein(3,0,t2) +B(2,:,i-1)*bernstein(3,1,t2) +B(3,:,i-1)*bernstein(3,2,t2)+ B(4,:,i-1)*bernstein(3,3,t2);
            norma = norm(b2)
            plot(b2(1),b2(2),'x', 'Color',C(l,:))
            hold on
        end
        b = bezier(B(:,:,i),t);
        H(l) = plot(b(:,1),b(:,2),'Color',C(l,:));
        hold on 
    end
    
    D{l} = sprintf('$\\alpha = %.2g$', alfa);
end
legend(H,D, 'Interpreter','latex', 'Location','SouthEast');

hold off