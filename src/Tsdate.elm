module Tsdate exposing (..)
import Parser as P exposing ((|=), (|.))


type alias Date =
    { year : Int
    , month : Int
    , day : Int
    }


dropZero : P.Parser ()
dropZero = P.chompWhile (\c -> c == '0')


parseInt : P.Parser Int
parseInt = P.succeed identity |. dropZero |= P.int

parseDate : P.Parser Date
parseDate =
    P.succeed Date
        |= parseInt
        |. P.symbol "-"
        |= parseInt
        |. P.symbol "-"
        |= parseInt