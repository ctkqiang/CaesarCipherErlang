%% [author] : 钟智强 <ctkqiang@dingtalk.com>
%% [project] : caesar_cipher
%% execute by caesar_cipher:cipher("whaettttt", 23).

-module(caesar_cipher).
-author("John Melody Me").

-export([cipher/2, key/1, rotate/2]).

key(Key) when Key < 0 ->
  26 + Key rem 26;
key(Key) when Key > 25 ->
  Key rem 26;
key(Key) ->
  Key.

rotate(Char, Key) when (Char >= $A) and (Char =< $Z) or
                        (Char >= $a) and (Char =< $z) ->
                            Offset = $A + Char band 32,
                            N = Char - Offset,
                            Offset + (N + Key) rem 26;
rotate(Char, _Key) ->
    Char.

cipher(Plaintext, Key) ->
    Encode = key(Key),
    % Decode = key(-Key),

    io:format("Original Text ~s~n", [Plaintext]),

    CypherText = lists:map(
      fun(Char) -> 
        rotate(Char, Encode) 
      end, 
      Plaintext
    ),

    % Plaintext = lists:map(fun(Char) -> rot(Char, Decode) end, CypherText), 
    io:format("Ciphered ~s~n", [CypherText]).
