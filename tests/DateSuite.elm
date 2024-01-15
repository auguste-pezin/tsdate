module DateSuite exposing (..)

import Expect as E
import Parser as P
import Test as T
import Tsdate as D exposing (..)

parseSuite : T.Test
parseSuite = T.concat
    [ T.test "Parse int" <|
        \_ -> E.equal (Ok 1) (P.run D.parseInt "01")
    , T.test "Parse date" <|
        \_ -> E.equal (Ok (D.Date 2023 12 31)) (P.run D.parseDate "2023-12-31")
    ]