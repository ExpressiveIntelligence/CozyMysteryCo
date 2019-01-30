%This is the file for generating conversational moves that Agatha can take.
%Requires information from an establishedFacts.lp file to seed all the choices.

action("ignore",Dect,Char) :- player_input(_,Char), detective_character(Dect), has_opinion(Char,Dect,"dislike").
action("insult",Dect,Char) :- player_input(_,Char), detective_character(Dect), has_opinion(Char,Dect,"dislike").
    
{chosen_action(A,Dect,Char) : action(A,Dect,Char)} = 4.
#show chosen_action/3.