divisible(X,Y) :- 0 is mod(X, Y), !.
divisible(X,Y) :- X > Y*2, divisible(X, Y+1).

isPrime(2) :- true.
isPrime(X) :- X < 2,!,false.
isPrime(X) :- not(divisible(X, 2)).

findResult(A, B) :- not(isPrime(A)), !, findResult(A+1, B-1).
findResult(A, B) :- not(isPrime(B)), !, findResult(A+1, B-1).
findResult(A, B) :- write(A), write(' '), write(B), nl, findResult(A+1, B-1).

isEven(X) :- 0 is mod(X, 2).

goldbach(X) :- not(isEven(X)), !, write('invalid input.').
goldbach(X) :- not(findResult(2, X-2)).

main :- write('Input : '), read(X), write('Output : '), nl, goldbach(X), halt.

:- initialization(main).
