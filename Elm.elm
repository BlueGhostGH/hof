module Main exposing (main)
-- See this code in action at https://ellie-app.com/6SMCPFqXrqsa1
import Html exposing (Html, text, div, br)
import String exposing (fromInt)
import List
import Browser

add : Int -> Int -> Int
add a =
    (+) a

each : (a -> b) -> List a -> List b
each f list =
    case list of
        [] ->
            []
        x :: xs ->
            f x :: each f xs

printHtmlString : Int -> Html ()
printHtmlString =
    text << fromInt

view : () -> Html ()
view _ =
    div []
        ([ printHtmlString <| add 1 2 ] ++ [br [] [] ] ++ each printHtmlString [ 1, 2, 3 ])

update : () -> () -> ()
update _ _ = ()

main : Program () () ()
main =
    Browser.sandbox
        { init = ()
        , view = view
        , update = update
        }
