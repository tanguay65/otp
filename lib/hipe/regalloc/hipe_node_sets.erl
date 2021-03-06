%% -*- erlang-indent-level: 2 -*-
%%
%% %CopyrightBegin%
%% 
%% Copyright Ericsson AB 2001-2009. All Rights Reserved.
%% 
%% The contents of this file are subject to the Erlang Public License,
%% Version 1.1, (the "License"); you may not use this file except in
%% compliance with the License. You should have received a copy of the
%% Erlang Public License along with this software. If not, it can be
%% retrieved online at http://www.erlang.org/.
%% 
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
%% the License for the specific language governing rights and limitations
%% under the License.
%% 
%% %CopyrightEnd%
%%

-module(hipe_node_sets).

-export([new/0,
	 spilled/1,
	 colored/1,
	 add_spilled/2,
	 add_colored/2
	]).

-record(node_sets, 
	{spilled,    % Nodes marked for spilling
	 colored     % Nodes succesfully colored
	}).

spilled(Node_sets) -> Node_sets#node_sets.spilled.
colored(Node_sets) -> Node_sets#node_sets.colored.
    
set_spilled(Spilled, Node_sets) -> Node_sets#node_sets{spilled = Spilled}.
set_colored(Colored, Node_sets) -> Node_sets#node_sets{colored = Colored}.

new() ->
  #node_sets{spilled = [], colored = []}.

add_spilled(Node, Node_sets) ->
  set_spilled([Node | spilled(Node_sets)], Node_sets).

add_colored(Node, Node_sets) ->
  set_colored([Node | colored(Node_sets)], Node_sets).
