{ peopleCount(4..10)} = 1.
idNumber(I) :- I=1..K, peopleCount(K).

{identity(I, N) : personID(N)} = 1 :- idNumber(I).
:- identity(I1,N), identity(I2,N), I1 != I2, personID(N).
person(N) :- identity(I,N).

%Setup
0 < {has_relationship(I1,I2,R) : relationship(R,_,_), person(I2), I1 != I2} < (K-1) :- person(I1), peopleCount(K).
has_relationship(I1,I2,R) :- relationship(R,undirected,_), has_relationship(I2,I1,R).

{has_opinion(I1,I2,O) : opinion(O)} = 1 :- person(I1), person(I2), I1 != I2.
    
{has_profession(I, P) : profession(P,_)} = 1 :- person(I).
{has_profession(I, P) : person(I)} <= N :- profession(P,N).
{has_modifier(I, P) : modifier(P,_)} <= 1 :- person(I).
{has_modifier(I, P) : person(I)} <= N :- modifier(P,N).

modifier_count(N) :- N = #count{person(I): has_modifier(I,_)}.
:- modifier_count(N), peopleCount(K), N < K/2. %Half or more of the characters have modifiers.
    
{personality(N,"primary",T) : primarytrope(T)}=1 :- identity(I, N).
{personality(N,"secondary",T) : trope(T)}=1 :- identity(I, N).
    
{has_value(N,1,V) : value(V)} = 1 :- person(N).
{has_value(N,2,V) : value(V)} = 1 :- person(N).
    
:- has_value(N,1,V), has_value(N,2,V), person(N), value(V).

%Validation

:- has_relationship(I1,I2,"professor_of"), person(I1), person(I2), not has_profession(I1,"professor").
:- has_relationship(I1,I2,"professor_of"), person(I1), person(I2), not has_profession(I2,"student").
:- has_relationship(I1,I2,"working_for"), has_relationship(I2,I1,"working_for").
:- has_relationship(I1,I2,"mentor_of"), has_relationship(I2,I1,"mentor_of").
    
relationshipCount(R,N) :- relationship(R, _,_), N = #count{peoplePair((I1,I2)): has_relationship(I1,I2,R)}.

personal_relationshipCount(P,N,1) :- person(P), N = #count{ r_ship_names(R): has_relationship(P,P2,R), person(P2)}.
personal_relationshipCount(P,N,2) :- person(P), N = #count{ r_ship_names(R): has_relationship(P2,P,R), person(P2)}.
personal_relationshipCount(P,N) :- N = N1 + N2, personal_relationshipCount(P,N1,1), personal_relationshipCount(P,N2,2).
    
:- relationshipCount(R,N), peopleCount(K), N >= K/2.
:- personal_relationshipCount(P,N), peopleCount(K), N > K.
:- person(P1), person(P2), has_relationship(P1,P2,R1), has_relationship(P1,P2,R2), R1 != R2.
:- has_relationship(I1,I1,T), person(I1).

:- personality(P,"primary",T), personality(P,"secondary",T).
:- personality(P1,"primary",T), personality(P2,"primary",T), P1 != P2.
    
%Tuning rules
{has_relationship(I1,I2,"secret_crush") : person(I1), person(I2)} < 2.

%Now, with these values and the total number of people, we can control how well people get along on average!
peoplePair((I1,I2)) :- person(I1), person(I2), I1 != I2.
likes(N) :- N = #count{peoplePair((I1,I2)) : has_opinion(I1,I2,"likes")}.
dislikes(N) :- N = #count{peoplePair((I1,I2)) : has_opinion(I1,I2,"dislikes")}.
neutral(N) :- N = #count{peoplePair((I1,I2)) : has_opinion(I1,I2,"neutral")}.  