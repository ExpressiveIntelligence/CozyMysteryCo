
{ peopleCount(4..8)} = 1.
person(I) :- I=1..K, peopleCount(K).
    
{identity(I, N) : personID(N,_,_)} = 1 :- person(I).
:- identity(I,N1), identity(I,N2), person(I), N1 != N2.
    
%Setup
0 < {has_relationship(I1,I2,R) : relationship(R,_), person(I2), I1 != I2} <= (K/2) :- peopleCount(K), person(I1).
has_relationship(I1,I2,R) :- relationship(R,undirected), has_relationship(I2,I1,R).
    
{has_profession(I, P) : profession(P)} = 1 :- person(I).

%Validation

:- has_relationship(I1,I2,"professor_of"), person(I1), person(I2), not has_profession(I1,"professor").
:- has_relationship(I1,I2,"professor_of"), person(I1), person(I2), not has_profession(I2,"student").
    
%Tuning rules
{has_relationship(I1,I2,"secret_crush") : person(I1), person(I2)} < 2.

%has_relationship(1,2,"professor_of").