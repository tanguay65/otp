%% This tests that the race condition detection between whereis/register
%% is robust w.r.t. having the calls in separate functions and modules.

-module(whereis_intra_inter_module4).
-export([no_race/1, race/2]).

no_race(Pid) ->
  register(master, Pid).
	
race(Atom, Pid) -> 
  continue(Atom, Pid).

continue(Atom, Pid) ->
  register(Atom, Pid).
