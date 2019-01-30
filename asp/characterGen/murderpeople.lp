{ peopleCount(4..10)} = 1.
idNumber(I) :- I=1..K, peopleCount(K).

{identity(I, N) : personID(N)} = 1 :- idNumber(I).
:- identity(I1,N), identity(I2,N), I1 != I2, personID(N).
person(N) :- identity(I,N).

%Setup
0 < {has_relationship(I1,I2,R) : relationship(R,_), person(I2), I1 != I2} < (K-1) :- person(I1), peopleCount(K).
has_relationship(I1,I2,R) :- relationship(R,undirected), has_relationship(I2,I1,R).

{has_opinion(I1,I2,O) : opinion(O)} = 1 :- person(I1), person(I2), I1 != I2.
    
{has_profession(I, P) : profession(P)} = 1 :- person(I).
{has_modifier(I, P) : modifier(P)} = 1 :- person(I).
    
{personality(N,"primary",T) : primarytrope(T)}=1 :- identity(I, N).
{personality(N,"secondary",T) : trope(T)}=1 :- identity(I, N).

%Validation

:- has_relationship(I1,I2,"professor_of"), person(I1), person(I2), not has_profession(I1,"professor").
:- has_relationship(I1,I2,"professor_of"), person(I1), person(I2), not has_profession(I2,"student").
:- has_modifier(I1,"is_secretly_right_about_the_science"), has_modifier(I2,"is_secretly_right_about_the_science"), I1 != I2.
    
%Tuning rules
{has_relationship(I1,I2,"secret_crush") : person(I1), person(I2)} < 2.

likes(N) :- N = #count{has_opinion(I1,I2,"likes") : person(I1), person(I2)}.

%has_relationship(1,2,"professor_of").