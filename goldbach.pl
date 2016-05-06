divisible(X,Y) :- 0 is mod(X, Y), !.
divisible(X,Y) :- X > Y*2, divisible(X, Y+1).

isPrime(2).
isPrime(3).

isPrime(X) :- X < 2, !, false.
isPrime(X) :- not(divisible(X, 2)).

findResult(A, B) :- A>B, !, false.
findResult(A, B) :- X is A, not(isPrime(X)), !, findResult(A + 1, B - 1).
findResult(A, B) :- Y is B, not(isPrime(Y)), !, findResult(A + 1, B - 1).
findResult(A, B) :- X is A, Y is B, write(X), write(' '), write(Y), nl, findResult(A + 1, B - 1).

isEven(X) :- 0 is mod(X, 2).

goldbach(X) :- not(isEven(X)), !, write('invalid input.'), nl.
goldbach(X) :- X =:= 2, !, write('invaild input. '), nl.
goldbach(X) :- not(findResult(2, X-2)).

main :- write('Input : '), read(X), write('Output : '), nl, goldbach(X), halt.

:- initialization(main).
