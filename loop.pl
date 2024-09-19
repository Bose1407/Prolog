% loop.pl
count_to_1000(1000) :- 
    writeln(1000).
count_to_1000(N) :- 
    N < 1000, 
    writeln(N), 
    N1 is N + 1, 
    count_to_1000(N1).


