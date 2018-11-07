%facts
character(c0).
character(c1).
isNobility(c1,false).
-siblingOf(c1,c0).
character(c2).
isNobility(c2,false).
character(c3).
-parentOf(c3,c1).
character(c4).
wealth(c4,2).
inLoveWith(c4,c3).
room(r0).
room(r1).
room(r2).
indoor(r2,false).
room(r3).
room(r4).
object(o0).
ownedBy(o0,c2).
object(o1).
object(o2).
size(o2,medium).
object(o3).
ownedBy(o3,c0).
object(o4).

% Some timesteps
t(1..10).

% Rules

% Some number of people are dead at the end. They're the victims.
1 { dead(X,10) : character(X) } 1.
victim(X) :- dead(X,10).

% Some number of people are in love
1 { inLoveWith(X,Y) : character(X), character(Y), X!=Y } 3.

% But not with themselves
:- inLoveWith(X,Y), X=Y.

loveTriangle(X,Y,Z) :- inLoveWith(X,Y), inLoveWith(Y,Z), X!=Z.
hates(X,Y) :- loveTriangle(X,_,Y).

% Every character is in a room 
inRoom(X,R) : room(R) :- character(X).

siblingOf(X,Y) :- siblingOf(Y,X).
childOf(X,Y) :- parentOf(Y,X).
parentOf(X,Y) :- childOf(Y,X).

% A suspect is someone with motive and opportunity

motive(X,Y) :- hates(X,Y). 

sharingRoom(X,Y) :- X!=Y, inRoom(X,R), inRoom(Y,R).

witness(X,Y,Z) :- sharingRoom(X,Z), sharingRoom(X,Y), Y!=Z.

% opportunity(X,Y) :- { inRoom(X,R) } = 2, room(R).

opportunity_potential (P1,P2) :- inRoom(P1,R), inRoom(P2,R), P1!=P2.
%blocking(R,V) :- inR

%1 {dead(X, 10):character(X)} 1.
%0 { opportunity(X,Y) : character(X), character(Y), sharingRoom(X,Y) } 10.

% Psychic killers always have opportunity
%opportunity(X,Y) :- psychicKiller(X),character(Y).
%1 {psychicKiller(X):character(X)} 3.

% generate some number
%suspect(X,Y) :- motive(X,Y), opportunity(X,Y), victim(Y).
%:- not 2 {suspect(X,Y):character(X),character(Y)} 3.

