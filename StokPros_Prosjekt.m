%Script for Prosjekt i Stok.Pros
%Matrisen til oppgave 1a og b
P = [0.5 , 0.35, 0.15;
    0.1, 0.75, 0.15;
    0.05, 0.6, 0.35];
%Matrise for � finne Pi
I = eye(3);
A = zeros(3);
A(1:3,1:3) = (P'-I);
A(4,:) = [1,1,1];
%A*piVec = [0,0,0,1]
A(:,4)=[0;0;0;1];

%Den stasjon�re l�sningen for pi blir
B = rref(A);
PI = B(1:3,4);



