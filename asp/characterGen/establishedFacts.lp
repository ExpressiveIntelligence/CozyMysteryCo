
sceneLocation(messHall).
inscene("Alice").
inscene("Bob").

personality("Alice","primary","Boss").
personality("Alice","secondary","Pessimist").
personality("Bob","primary","Rugged").
personality("Bob","secondary","Resigned").

has_relationship("Alice","Cindy","mentor_of").
has_relationship("Bob","Cindy","working_for").

has_profession("Alice","giftshopkeep").
has_profession("Bob","skier").

has_modifier("Alice","in_hiding").
has_modifier("Bob","hates_this_place").

personality("Cindy","primary","Big Fun").
personality("Cindy","secondary","Jerk").
has_modifier("Cindy","is_dying").
has_relationship("Cindy","Isabel","professor_of").
has_profession("Cindy","professor").

has_opinion("Alice","Bob","dislike").
has_opinion("Bob","Alice","neutral").

player_input("greet","Bob").
detective_character("Alice").