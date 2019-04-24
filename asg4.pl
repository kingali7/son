% CSCI3180 Principles of Programming Languages

% --- Declaration ---

% I declare that the assignment here submitted is original except for source
% material explicitly acknowledged. I also acknowledge that I am aware of
% University policy and regulations on honesty in academic work, and of the
% disciplinary guidelines and procedures applicable to breaches of such policy
% and regulations, as contained in the website
% http://www.cuhk.edu.hk/policy/academichonesty/
% Credits to the my roommate Huzeyfe KIRAN(1155104019).
% Assignment 4
% Name : Alshir Soyunjov
% Student ID : 1155119170

% Rules
sum(0,X,X).
sum(s(X),Y,s(Z)) :- sum(X,Y,Z).

% 1.a Rules
natNum(0).
natNum(s(X)) :- natNum(X).

% 1.b Rules
lt(X,s(X)).
lt(X,Y) :- sum(X,s(Z),Y), natNum(Z).
% % ?- lt(X,s(s(s(0)))).
% ?- natNum(lt(X,3)).

% 1.d Rules
geq(X,Y) :- sum(Z,Y,X), natNum(Z).

% 1.e Rules
max(X,Y,Z) :- geq(Z,X), geq(Z,Y).

% 1.f Rules
difference(X,Y,Z) :- sum(Y,Z,X).

% 1.g Rules
mod(X,Y,Z) :- lt(Z,Y), geq(X,Z), difference(X,Z,D), multiple(Y,D).
multiple(X,0) :- X=s(_).
multiple(X,Y) :- X=s(_), Y=s(_), geq(Y,X), difference(Y,X,D), multiple(X,D).

% 2.a Rules
% bt(a,bt(b,nil,bt(d,nil,nil)),bt(c,bt(e,bt(f,nil,nil),bt(g,nil,nil)),nil)).

% 2.b Rules
isTree(nil).
isTree(bt(_,L,R)) :- isTree(L), isTree(R).

% 2.c Rules
isLeaf(X,bt(X,nil,nil)).
isLeaf(X,bt(Rt,L,R)) :- isLeaf(X,L).
isLeaf(X,bt(Rt,L,R)) :- isLeaf(X,R).

% 2.d Rules
numberOfLeaf(nil,N) :- N=0.
numberOfLeaf(bt(E,nil,nil),N) :- isTree(bt(E,nil,nil)), N=s(0).
numberOfLeaf(bt(Rt,L,R),N) :- isTree(bt(Rt,L,R)), numberOfLeaf(L,LN), numberOfLeaf(R,RN), sum(LN,RN,N).

% 2.e Rules	
height(nil, 0).  
height(bt(_,L,R),H) :- height(L,L1), height(R,R1), max(R1,L1,M), sum(s(0),M,H). 