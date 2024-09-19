% Facts: Defining family relationships
% parent(Parent, Child)
parent(john, mary).
parent(john, michael).
parent(susan, mary).
parent(susan, michael).
parent(mary, james).
parent(mary, linda).
parent(peter, james).
parent(peter, linda).

% Defining genders
male(john).
male(michael).
male(james).
male(peter).

female(susan).
female(mary).
female(linda).

% Rules: Defining family relationships using logic

% Father rule: A father is a parent who is male
father(Father, Child) :-
    parent(Father, Child),
    male(Father).

% Mother rule: A mother is a parent who is female
mother(Mother, Child) :-
    parent(Mother, Child),
    female(Mother).

% Sibling rule: Siblings share at least one parent
sibling(Sibling1, Sibling2) :-
    parent(Parent, Sibling1),
    parent(Parent, Sibling2),
    Sibling1 \= Sibling2.

% Grandparent rule: A grandparent is a parent of a parent
grandparent(Grandparent, Grandchild) :-
    parent(Grandparent, Parent),
    parent(Parent, Grandchild).

% Grandfather rule: A grandfather is a grandparent who is male
grandfather(Grandfather, Grandchild) :-
    grandparent(Grandfather, Grandchild),
    male(Grandfather).

% Grandmother rule: A grandmother is a grandparent who is female
grandmother(Grandmother, Grandchild) :-
    grandparent(Grandmother, Grandchild),
    female(Grandmother).

% Ancestor rule: An ancestor is a parent or a parent of an ancestor (recursive rule)
ancestor(Ancestor, Descendant) :-
    parent(Ancestor, Descendant).

ancestor(Ancestor, Descendant) :-
    parent(Ancestor, Intermediate),
    ancestor(Intermediate, Descendant).