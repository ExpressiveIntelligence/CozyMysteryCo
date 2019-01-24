personID("Bob",value(1),value(2)).
personID("Cindy",value(1),value(3)).
personID("Bob2",value(2),value(3)).
personID("Cindy2",value(1),value(4)).
personID("Bob3",value(2),value(4)).
personID("Cindy3",value(3),value(4)).
personID("Bob4",value(1),value(5)).
personID("Cindy4",value(2),value(5)).
personID("Bob5",value(3),value(5)).
personID("Cindy5",value(4),value(5)).
personID("Bob6",value(1),value(6)).
personID("Cindy6",value(2),value(6)).
personID("Bob7",value(3),value(6)).
personID("Cindy7",value(4),value(6)).
personID("Cindy8",value(5),value(6)).

relationship("sibling_of", undirected).
relationship("secret_crush", directed).
relationship("dating", undirected).
relationship("loathes", directed).
relationship("holds_grudge", directed).
relationship("friend_of", undirected).

relationship("coauthors", undirected).
relationship("working_for", directed).
relationship("mutual_rivals", undirected).
relationship("rivals", directed).
relationship("mentor_of", directed).
relationship("professor_of", directed).

profession("professor").
profession("student").
profession("observatory_caretaker").
profession("groundskeeper").
profession("psychic").
profession("reporter").
profession("skier").
profession("astronomer").

modifier("is_rich").
modifier("is_dying").
modifier("has_funding").
modifier("has_theory_about_astronomical_event").
