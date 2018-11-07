let timeCount = 10;
let worldSettings = {
	count: {
		object: 5,
		room: 3,
		character: 4
	},


	rules:  `
		
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
		
		%witness(X,Y,Z) :- sharingRoom(X,Z), sharingRoom(X,Y), Y!=Z.

		%opportunity(X,Y) :- { inRoom(X,R) } = 2, room(R).
		%opportunity_potential (P1,P2) :- inRoom(P1,R), inRoom(P2,R), P1!=P2.

		% A potential victim is blocked from being murdered if there is a 3rd
		% party in the room (who doesn't also have a motive to kill the victim)
		blocked (V) :- inRoom(P1,R), inRoom(V,R), V!=P1, not motive(P1,V).

		opportunity(P1,P2) :- sharingRoom(P1,P2), not blocked(P2).

		%1 {dead(X, 10):character(X)} 1.
		%0 { opportunity(X,Y) : character(X), character(Y), sharingRoom(X,Y) } 10.
		
		% Psychic killers always have opportunity
		%opportunity(X,Y) :- psychicKiller(X),character(Y).
		%1 {psychicKiller(X):character(X)} 3.
		
		% Generate some number of suspects
		suspect(X,Y) :- motive(X,Y), opportunity(X,Y), victim(Y).
		1 { suspect(X,Y) : character(X), character(Y) } 2.
		`,

	// What someone/something is, always
	// Can also have "pretending" overlays?
	properties: {
		// Character properties
		character: {
			gender: ["m", "f", "n"],
			morality: ["evil", "neutral", "good"],
			wealth: [0, 1, 2],
			isNobility: ["true", "false"]
		},

		room: {
			carpeted: ["true", "false"],
			indoor: ["true", "false"],
		},

		obj: {
			size: ["small", "medium", "large"],
		}
	},

	// What someone/something can be at some time 
	// True/false
	conditions: {
		character: ["sick", "dead", "asleep"],
		room: ["lit"],
		co: ["hidden"],
		all: ["onFire"]
	},

	relationships: {
		character: {
			character: ["inLoveWith", "parentOf", "siblingOf", "businessRivalOf"],
		},
		room: {
			room: ["canSee", "connectedTo"],
		},
		object: {
			character: ["ownedBy*"]
		}
	},

	tempRelationships: {
		character: {
			room: ["inRoom*"]
		},

		object: {
			co: ["heldBy*"],
			character: ["desiredBy"]
		},
		
	}
}