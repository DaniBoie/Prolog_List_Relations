
% Test Relations 
speed(ford, 100).
speed(chevy, 105).
speed(dodge, 95).
speed(volvo, 80).
time(ford, 20).
time(chevy, 21).
time(dodge, 24).
time(volvo, 24).
distance(X, Y) :- speed(X, Speed),
 time(X, Time),
 Y is Speed * Time.

% Question 1: Define a relation my_length that takes two arguments, a list L, and an argument, R, for the number of top_level elements in L.

my_length([], 0).

% my_length([_|Tail], Length) :- my_length(Tail, R).

% Question 2: Define a relation my_member that takes two arguments, a symbol A and a list of symbols L, succeeds when the symbol bound to A is found within L.   It fails otherwise.

my_member(Member, [Member | _]).
my_member(Member, [_ | Tail]) :- my_member(Member, Tail).