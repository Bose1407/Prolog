% 1. The main predicate to solve the 4-Queens problem
solve_queens :-
    Queens = [Q1, Q2, Q3, Q4],  % 2. Create a list representing the columns of the queens
    permutation([1, 2, 3, 4], Queens),  % 3. Generate all possible column permutations
    safe(Queens),  % 4. Check if the queens are placed safely
    write(Queens), nl.  % 5. Print the solution

% 6. Predicate to check if all queens are placed safely
safe([]).  % 7. Base case: an empty list is always safe
safe([Q|Others]) :-  % 8. Split the list into head (Q) and tail (Others)
    safe_from(Q, Others, 1),  % 9. Check if the first queen is safe from the others
    safe(Others).  % 10. Recursively check the safety of the remaining queens

% 11. Predicate to check if a queen Q is safe from the other queens
safe_from(_, [], _).  % 12. Base case: No other queens to check against
safe_from(Q, [Q1|Others], Dist) :-  % 13. Split the remaining queens into head (Q1) and tail (Others)
    Q =\= Q1,  % 14. Ensure Q is not in the same column as Q1
    abs(Q1 - Q) =\= Dist,  % 15. Ensure Q is not on the same diagonal as Q1
    NextDist is Dist + 1,  % 16. Move to the next queen (increase distance)
    safe_from(Q, Others, NextDist).  % 17. Recursively check the next queen 