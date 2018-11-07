let timeCount = 10;
let worldSettings = {
	count: {
		object: 5,
		room: 3,
		character: 4
	},
	
	rules:  '',

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
};

// Load rules from separate ASP file

$.ajax({
   	url: "js/murderhouse/aspprogram.lp",
   	success: function(text) {
   		worldSettings.rules = text;
    },
   	async:false
});
