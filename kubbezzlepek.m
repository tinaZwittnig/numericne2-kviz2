function B = kubbezzlepek(u,P,a ,b )
% Opis:
%  kubbezzlepek izracuna kontrolne tocke Bezierjevih krivulj stopnje 3, ki
%  sestavljajo dvakrat zvezno odvedljiv kubicen zlepek: ta interpolira dane
%  tocke nad dano delitvijo domene parametrizacije, njegov odvod v robnih
%  tockah pa je enak a in v drugi točki b
%
% Definicija:
%  B = kubbezzlepek(u,P)
%
% Vhodna podatka:
%  u    seznam m+1 delilnih tock,
%  P    seznam m+1 ravninskih interpolacijskih tock
%  a    odvod v prvem krjišču
%  b    odvod v drugem krajišču
%
% Izhodni podatek:
%  B    tabela velikosi 4 x 2 x m, v kateri vsak nivo velikosti 4 x 2
%       doloca kontrolne tocke Bezierjeve krivulje stopnje 3, ki
%       predstavlja en kos zlepka

m = length(u)-1;

du = diff(u);
dup = du(1:end-1);
dun = du(2:end);
dP = diff(P);

A = diag(dun(2:end),-1) + diag(2*(dup+dun)) + diag(dup(1:end-1),1);
B1 = 3*((dun./dup)'.*dP(1:end-1,1) + (dup./dun)'.*dP(2:end,1));
B2 = 3*((dun./dup)'.*dP(1:end-1,2) + (dup./dun)'.*dP(2:end,2));

B1(1) = B1(1) - a(1)*dun(1);
B1(end) = B1(end) - b(1) *dup(end);
B2(1) = B2(1) - a(2) * dun(1);
B2(end) = B2(end) - b(2) * dup(end);
    

V = [a; A\B1 A\B2; b];

B = zeros(4,2,m);
for k = 1:m
    B(1,:,k) = P(k,:);
    B(2,:,k) = P(k,:) + du(k)*V(k,:)/3;
    B(3,:,k) = P(k+1,:) - du(k)*V(k+1,:)/3;
    B(4,:,k) = P(k+1,:);
end

end