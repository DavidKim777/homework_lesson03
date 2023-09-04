-module(lesson3_task2). 
-export([words/1]).

words(BinText) ->
    words(BinText, <<>>, []).

words(<<" ", Rest/binary>>, Acc, Acc1) ->
    words(Rest, <<>>, [Acc|Acc1]);
words(<<H, Rest/binary>>, Acc,Acc1) ->
    words(Rest, <<Acc/binary, H>>, Acc1);
words(<<>>, Acc, Acc1) ->
    lesson2_task05:reverse([Acc|Acc1]).