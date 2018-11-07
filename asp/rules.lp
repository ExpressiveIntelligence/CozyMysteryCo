% Main ASP Problem Encoding / Rules 
% Requires a set of facts to run

% Some timesteps
t(1..10).

% Some number of people are dead at the end. They're the victims.
1 { dead(X,10) : character(X) } 1.
victim(X) :- dead(X,10).

% Some number of people are in love
1 { inLoveWith(X,Y) : character(X), character(Y), X!=Y } 3.

% But not with themselves
:- inLoveWith(X,Y), X=Y.

loveTriangle(X,Y,Z) :- inLoveWith(X,Y), inLoveWith(Y,Z), X!=Z.
hates(X,Y) :- loveTriangle(X,_,Y).

% Family relations
siblingOf(X,Y) :- siblingOf(Y,X).
childOf(X,Y) :- parentOf(Y,X).
parentOf(X,Y) :- childOf(Y,X).

% Every character is in a room 
inRoom(X,R) : room(R) :- character(X).
sharingRoom(X,Y) :- X!=Y, inRoom(X,R), inRoom(Y,R).

% Character M has motive to kill V if M hates V
motive(M,V) :- hates(M,V). 

%witness(X,Y,Z) :- sharingRoom(X,Z), sharingRoom(X,Y), Y!=Z.

%opportunity(X,Y) :- { inRoom(X,R) } = 2, room(R).
%opportunity_potential (P1,P2) :- inRoom(P1,R), inRoom(P2,R), P1!=P2.

% A potential victim, V, is blocked from being murdered (by anyone) if 
% there is someone in the room, M, (who doesn't have a motive to kill the victim)
blocked (V) :- sharingRoom(V,M), not motive(M,V).

opportunity(M,V) :- sharingRoom(M,V), not blocked(V).

%1 {dead(X, 10):character(X)} 1.
%0 { opportunity(X,Y) : character(X), character(Y), sharingRoom(X,Y) } 10.

% Psychic killers always have opportunity
%opportunity(X,Y) :- psychicKiller(X),character(Y).
%1 {psychicKiller(X):character(X)} 3.

% A suspect, M, is someone with motive and opportunity
suspect(M,V) :- motive(M,V), opportunity(M,V), victim(V).

% Generate some number of suspects
1 { suspect(M,V) : character(M), character(V) } 2.


