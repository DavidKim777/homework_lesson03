-module(lesson3_task1).
-export([first_word/1]).

first_word(BinText) ->
    first_word(BinText, <<>>).


first_word(<<>>, Acc ) ->
    Acc;
first_word(<<" ", _Rest/binary>>, Acc) ->
    Acc;
first_word(<<H, Rest/binary>>, Acc) ->
    first_word(Rest, <<Acc/binary, H>>).
