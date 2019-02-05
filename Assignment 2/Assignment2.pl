 %Q1
s --> left(TwoX), two, right(OneX), {TwoX is OneX+OneX}.
left(0)     --> [].
left(OneX) --> [0], left(Decrement), {OneX is Decrement+1}.
left(OneX) --> [1], left(OneX).
two --> [2].
right(0)     --> [].
right(OneX) --> [1], right(Decrement), {OneX is Decrement+1}.
right(OneX) --> [0], right(OneX).

% Q2
s -->  house(Col1,Nat1,Pet1), house(Col2,Nat2,Pet2),house(Col3,Nat3,Pet3),
	      {Col1 \== Col2}, {Col2 \== Col3}, {Col3 \== Col1},
        {Nat1 \== Nat2}, {Nat2 \== Nat3}, {Nat3 \== Nat1},
        {Pet1 \== Pet2}, {Pet2 \== Pet3}, {Pet3 \== Pet1}.
house(Col,Nat,Pet) -->	colour(Col),nationality(Nat),pet(Pet).

colour('red')   --> [red].
colour('blue')  --> [blue].
colour('green') --> [green].
nationality('english')  --> [english].
nationality('spanish')  --> [spanish].
nationality('japanese') --> [japanese].
pet('jaguar') --> [jaguar].
pet('snail')  --> [snail].
pet('zebra')  --> [zebra].

% Q3

mkList(0, []).
mkList(Num, [Num|List]) :- Temp is Num-1, Num > 0, mkList(Temp, List).

s(0) --> [].
s(Num) --> {mkList(Num, List)}, [Temp], {member(Temp, List)}, {Remainder is Num-Temp}, s(Remainder).
