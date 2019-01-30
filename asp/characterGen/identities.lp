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

%relationship("sibling_of", undirected).
%relationship("secret_crush", directed).
%relationship("dating", undirected).
%relationship("exes", undirected).
%relationship("loathes", directed).
%relationship("admires", directed).
%relationship("protective_of", directed).
%relationship("holds_grudge", directed).
%relationship("friend_of", undirected).

relationship("coauthors", undirected).
relationship("working_for", directed).
relationship("mutual_rivals", undirected).
relationship("rivals", directed).
relationship("mentor_of", directed).
relationship("professor_of", directed).

opinion("likes").
opinion("neutral").
opinion("dislikes").

profession("professor").
profession("student").
profession("observatory_caretaker").
profession("groundskeeper").
profession("psychic").
profession("reporter").
profession("skier").
profession("astronomer").
profession("volunteer").
profession("high schooler").

modifier("is_rich").
modifier("in_debt").
modifier("is_dying").
modifier("has_funding").
modifier("has_theory_about_astronomical_event").
modifier("is_secretly_right_about_the_science").

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