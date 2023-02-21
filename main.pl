
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

% Question 1 : Define a relation my_length that takes two arguments, a list L, and an argument, R, for the number of top_level elements in L.

my_length([], 0).

my_length([_|Tail], Length) :- my_length(Tail, R), Length is 1 + R.

% Question 2 : Define a relation my_member that takes two arguments, a symbol A and a list of symbols L, succeeds when the symbol bound to A is found within L.   It fails otherwise.

my_member(Member, [Member | _]).
my_member(Member, [_ | Tail]) :- my_member(Member, Tail).

% Question 3 : Define a relation my_append that takes three arguments, list L1 and list L2, and an argument, R, which is the result of appending the two lists L1 and L2 together.

my_append([], List, List).
my_append([L1Head | List1], List2, [L1Head | List3]) :- my_append(List1, List2, List3).

% Question 4 : Define the relation my_reverse that takes a list L and another argument R which is the reversal of list L.

my_reverse([], []).
my_reverse([L1Head | List1], Reverse_List) :- my_reverse(List1, L1Reverse), my_append(L1Reverse, [L1Head], Reverse_List).

% Question 5 : Define a relation my_nth that takes a list L and a positive integer N (N>0) and binds to the third argument, the tail of L beginning with the Nth element.

% my_nth(List, N, Return_List).

my_nth([], _, []).
my_nth(List, 1, List).
my_nth([_ | List], N, Return_List) :- T is N - 1, my_nth(List, T, Return_List).