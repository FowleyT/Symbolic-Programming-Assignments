% Q1
incr(null,f1(null)).
incr(f0(X),f1(X)).
incr(f1(Y),f0(X)):-	incr(Y,X). 				% Recursively increment

% Q2 Part A
legal(f0(null)).
legal(X) :- legal(Y),
						incr(Y,X).								% Recursion
% Q2 Part B
incrR(X,Y):- legal(X),
						 incr(X,Y).

% Q3
add(null,X,X).                 				% Adding Zero
add(X,null,X).											  % Adding Zero
add(f0(X),f0(Y),f0(Z)):- add(X,Y,Z).
add(f0(X),f1(Y),f1(Z)):- add(X,Y,Z).
add(f1(X),f0(Y),f1(Z)):- add(X,Y,Z).
add(f1(X),f1(Y),f0(Z)):- add(X,Y,A),
												 incr(A,Z).

% Q4
mult(null,_,f0(null)).								% Multiply by zero
mult(_,null,f0(null)).								% Multiply by zero
mult(f0(X),Y,Z):- mult(X,f0(Y),Z).
mult(f1(X),Y,Z):- mult(X,f0(Y),A),
								  add(A,Y,Z).

% Q5
revers(null,null).
revers(f1(X),Y):- rev(X,f1(null),Y).
revers(f0(X),Y):- rev(X,f0(null),Y).
rev(null,X,X). 										  % Send back reversed bitstring
rev(f1(X),Y,Z):- rev(X,f1(Y),Z).
rev(f0(X),Y,Z):- rev(X,f0(Y),Z).

% Q6
normalize(null,f0(null)).
normalize(X,Z):- revers(X,Y),
								 norm(Y,W),
								 revers(W,Z).
norm(f0(X),Y):- norm(X,Y).
norm(f1(X),f1(X)).





% Clauses Given in hw1.pdf

% test add inputting numbers N1 and N2
testAdd(N1,N2,T1,T2,Sum,SumT) :- numb2pterm(N1,T1), numb2pterm(N2,T2),
add(T1,T2,SumT), pterm2numb(SumT,Sum).

% test mult inputting numbers N1 and N2
testMult(N1,N2,T1,T2,N1N2,T1T2) :- numb2pterm(N1,T1), numb2pterm(N2,T2),
mult(T1,T2,T1T2), pterm2numb(T1T2,N1N2).

% test revers inputting list L
testRev(L,Lr,T,Tr) :- ptermlist(T,L), revers(T,Tr), ptermlist(Tr,Lr).

% test normalize inputting list L
testNorm(L,T,Tn,Ln) :- ptermlist(T,L), normalize(T,Tn), ptermlist(Tn,Ln).

% make a pterm T from a number N numb2term(+N,?T)
numb2pterm(0,f0(null)).
numb2pterm(N,T) :- N>0, M is N-1, numb2pterm(M,Temp), incr(Temp,T).

% make a number N from a pterm T pterm2numb(+T,?N)
pterm2numb(null,0).
pterm2numb(f0(X),N) :- pterm2numb(X,M), N is 2*M.
pterm2numb(f1(X),N) :- pterm2numb(X,M), N is 2*M +1.

% reversible ptermlist(T,L)
ptermlist(null,[]).
ptermlist(f0(X),[0|L]) :- ptermlist(X,L).
ptermlist(f1(X),[1|L]) :- ptermlist(X,L).
