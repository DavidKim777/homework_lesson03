-module(lesson3_task3).
-export([split/2]).

len(BinText) ->
    len(BinText,0).

len(<<>>, N) ->
    N;
len(<<_,Rest/binary>>, N) ->
   len(Rest, N+1). 

split(BinText, SeparList) ->
    Separ = list_to_binary(SeparList),
    SeparLen = len(Separ),
    split(BinText, Separ, <<>>, [],SeparLen).

split(<<>>, _Separ, Acc, Acc2, _SeparLen) ->
    lists:reverse([Acc|Acc2]);
split(BinText, Separ, Acc, Acc2, SeparLen) ->
    case cutter(BinText, SeparLen) of
        error ->
            split(<<>>, Separ, <<Acc/binary, BinText/binary>>, Acc2, SeparLen);
        {Separ, Rest} ->
           split(Rest, Separ, <<>>, [Acc|Acc2], SeparLen); 
        _ -> 
            <<El, Rest/binary>> = BinText,
            split(Rest, Separ, <<Acc/binary, El>>, Acc2, SeparLen)
    end.


cutter(BinText, N) ->
    cutter(BinText, N, <<>>).

cutter(<<>>, N, _) when N > 0 ->
    error;
cutter(<<X, Rest/binary>>, 1, Acc) ->
    {<<Acc/binary, X>>, Rest};
cutter(<< X, Rest/binary>>, N, Acc) ->
    cutter(Rest, N-1, <<Acc/binary, X>>).