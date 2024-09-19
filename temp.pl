% Celsius to Fahrenheit
celsius_to_fahrenheit(C, F) :-
    F is C * 9 / 5 + 32.

% Fahrenheit to Celsius
fahrenheit_to_celsius(F, C) :-
    C is (F - 32) * 5 / 9.
