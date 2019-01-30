personID("Alice").
personID("Bob").
personID("Cindy").
personID("Dan").
personID("Eliza").
personID("Fred").
personID("Georgia").
personID("Henry").
personID("Isabel").
personID("John").
personID("Kate").
personID("Louis").

relationship("coauthors", undirected,professional).
relationship("working_for", directed,professional).
relationship("mutual_rivals", undirected,professional).
relationship("rivals", directed,professional).
relationship("mentor_of", directed,professional).
relationship("professor_of", directed,professional).

relationship("secret_crush", directed,romantic).
relationship("dating", undirected,romantic).
relationship("exes", undirected,romantic).

relationship("sibling_of", undirected,family).
relationship("married", undirected,family).

opinion("likes").
opinion("neutral").
opinion("dislikes").

profession("professor",2).
profession("student",4).
profession("observatory_caretaker",1).
profession("groundskeeper",1).
profession("psychic",1).
profession("reporter",1).
profession("skier",2).
profession("astronomer",2).
profession("volunteer",1).
profession("high schooler",1).
profession("giftshopkeep",1).
profession("security",1).
profession("tourist",1).
profession("tour guide",1).
profession("archivist",1).

modifier("is_rich",1).
modifier("in_debt",1).
modifier("is_dying",1).
modifier("is_important_online",1).
modifier("celebritiy_status",1).
modifier("outsider",1).
modifier("secret_expert",1).
modifier("in_hiding",1).
modifier("has_funding",1).
modifier("has_theory_about_astronomical_event",2).
modifier("is_secretly_right_about_the_science",1).
modifier("protective_of_observatory",2).
modifier("hates_this_place",1).

trope(X) :- primarytrope(X).

primarytrope("Absent-Minded Professor").
primarytrope("Big Fun").
primarytrope("Boss").
primarytrope("Bad-to-the-bone").
primarytrope("Parent Figure").
primarytrope("Innocent").
primarytrope("Clown").
primarytrope("Nerd").
primarytrope("Tortured Artist").
primarytrope("Gentle Giant").
primarytrope("Scruffy and Gruff").
primarytrope("Regal Presence").
primarytrope("Seductive").
primarytrope("Dumb Muscle").
primarytrope("Elderly Master").
primarytrope("Know-it-all").
primarytrope("Strict/By-the-books").
primarytrope("Rugged").
primarytrope("Lone Wolf").
primarytrope("Athlete").
primarytrope("Eccentric").

trope("Peacemaker").
trope("Pessimist").
trope("Optimist").
trope("Introvert").
trope("Extrovert").
trope("Jerk").
trope("Resigned").
trope("Loyalist").
trope("Friend Next Door").
trope("Child").
trope("Outspoken").
trope("Mousey/Shy").
trope("Conscience").
trope("Imposter/Pretender").
trope("Side Kick").
trope("Astrology Buff").
trope("Socially Awkward/Misses Cues").