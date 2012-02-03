%%%-------------------------------------------------------------------
%% @copyright Geoff Cant
%% @author Geoff Cant <nem@erlang.geek.nz>
%% @version {@vsn}, {@date} {@time}
%% @doc
%% @end
%%%-------------------------------------------------------------------

-module({{fsmid}}).
-behaviour(gen_fsm).
-define(SERVER, ?MODULE).

-include("{{appid}}_log.hrl").
-include_lib("eunit/include/eunit.hrl").

-record(state, {replaceme}).

%% ------------------------------------------------------------------
%% API Function Exports
%% ------------------------------------------------------------------

-export([start_link/0]).

%% ------------------------------------------------------------------
%% gen_fsm Function Exports
%% ------------------------------------------------------------------

-export([init/1, state_name/2, state_name/3, handle_event/3,
         handle_sync_event/4, handle_info/3, terminate/3,
         code_change/4]).

%% ------------------------------------------------------------------
%% API Function Definitions
%% ------------------------------------------------------------------

start_link() ->
    gen_fsm:start_link(?MODULE, [], []).

%% ------------------------------------------------------------------
%% gen_fsm Function Definitions
%% ------------------------------------------------------------------

%% @private
init(_Args) ->
    {ok, initial_state_name, #state{}}.

%% @private
state_name(_Event, State) ->
    {next_state, state_name, State}.

%% @private
state_name(Event, _From, State) ->
    ?WARN("[state ~p] Unexpected event ~p",
          [state_name, Event]),
    {next_state, state_name, State}.

%% @private
handle_event(_Event, StateName, State) ->
    {next_state, StateName, State}.

%% @private
handle_sync_event(Event, _From, StateName, State) ->
    ?WARN("[state ~p] Unexpected event ~p",
          [StateName, Event]),
    {next_state, StateName, State}.

%% @private
handle_info(Info, StateName, State) ->
    ?WARN("Unexpected info ~p", [Info]),
    {next_state, StateName, State}.

%% @private
terminate(_Reason, _StateName, _State) ->
    ok.

%% @private
code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.

%% ------------------------------------------------------------------
%% Internal Function Definitions
%% ------------------------------------------------------------------
