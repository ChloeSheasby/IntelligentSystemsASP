%% Notice: the raw grounded program from gringo has a ';' in line 18.
%%      grASP needs it to be changed to an even cycle.

id(1..3).
data(p_a). data(p_b). data(q_a), data(q_b).
valid_stream(P,Data) :- 
        id(P), data(Data),
     stream(P,Data), 
     not cancelled(P, Data).
cancelled(P, Data) :- 
        id(P1), id(P), data(Data1), data(Data),
     higher_prio(P1, P), 
     stream(P1, Data1), 
     incompt(Data, Data1).
higher_prio(PHi, PLo) :- 
        id(PHi), id(PLo),
     PHi > PLo.
incompt(p_a, q_a).
incompt(p_b, q_b).
incompt(q_a, p_a).
incompt(q_b, p_b).

stream(1, p_a).
stream(1, p_b).
stream(2, q_a).
stream(2, q_b).
stream(3, p_a).