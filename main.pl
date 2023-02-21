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

my_nth([], _, []).
my_nth(List, 1, List).
my_nth([_ | List], N, Return_List) :- T is N - 1, my_nth(List, T, Return_List).

% Question 6 : Define a relation my_remove that takes a term X and a list L and binds the third argument R to a version of L with all top level occurrences of X removed from L.

my_remove(_, [], []).
my_remove(X, [X | List], R) :- my_remove(X, List, R).
my_remove(X, [Head | List], [Head | R]) :- my_remove(X, List, R).

% Question 7 : Define a relation my_subst that takes four arguments X Y Z and binds R to a version of Z with all occurrences of X replaced with Y.

% my_subst(X, Y, Z, R)

my_subst(_, _, [], []).
my_subst(X, Y, [X | Z], [Y | R]) :- my_subst(X, Y, Z, R).
my_subst(X, Y, [Head | Z], [Head | R]) :- my_subst(X, Y, Z, R).

% Question 8 : Define a relation my_subset that takes a relation P and a list L and binds the third argument R to a list with a subset of the elements of list L that satisfy the relation P.

% my_subset(P, L, R).

my_subset(_, [], []).
% Case for True.
my_subset(P, [Head | L], [Head | R]) :- call(P, Head), my_subset(P, L, R).
% Case for False.
my_subset(P, [_ | L], R) :- my_subset(P, L, R).

% Question 9 : Define a relation my_add that takes two lists of single digit integers, N1 and N2, which represent large magnitude positive integer numbers called big_nums, and binds the third parameter to a list in this big_num representation corresponding to adding the two big_nums N1 and N2.

% my_add(N1, N2, R).

my_add([], N2, N2).
my_add(N1, [], N1).

% N1 + N2 > 9
my_add([N1Head | N1], [N2Head | N2], [Carryout | R]) :- Res is N1Head + N2Head, Res > 9, Carryout is Res - 10, my_add(N1, N2, RecurseList),  my_add([1], RecurseList, R).
% else
my_add([N1Head | N1], [N2Head | N2], [Res | R]) :- Res is N1Head + N2Head, my_add(N1, N2, R).

% Question 10 : Define a relation my_merge that takes two sorted lists of integers L1 and L2 and binds the third argument, R, to the result of merging the two sorted lists of integers similar to how merge_sort might do it.

% my_merge (L1, L2, R) !!!!!!!!!!!!!!!
my_merge([], L2, L2).
my_merge(L1, [], L1).


my_merge([L1Head | L1], [L2Head | L2], [L2Head | R]) :- L1Head > L2Head, my_append([L1Head], L1, Res), my_merge(Res, L2, R).

% L1Head <= L2Head
my_merge([L1Head | L1], [L2Head | L2], [L1Head | R]) :- L1Head <= L2Head, my_append([L2Head], L2, Res), my_merge(L1, Res, R).

% Question 11 : Define a relation my_sublist that takes two lists of atoms L1 and  L2 and succeeds only if L1 is a sublist of L2

% my_sublist(L1, L2) !!!!!!!!!!!

my_sub(L1, L2) :- my_length(L1, L1L), my_length(L2, L2L), L1L > L2L, write("false").


% Question 12 : Define the relation my_assoc that takes an atom A and an association list ALIST and binds R to the value associated with A in ALIST. If there is no association for A, it fails.

% my_assoc(A, ALIST, R).
my_assoc(A, [A | ALIST], R) :- [R | ALIST].
my_assoc(A, [_ | ALIST], R) :- my_assoc(A, ALIST, R).