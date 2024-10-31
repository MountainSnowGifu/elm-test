module Main2 exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Random



-- RANDOM GENERATOR


probability : Random.Generator Int
probability =
    Random.int 1 10



-- 1から10までのランダムな整数を生成
-- MAIN


main : Program () Model Msg
main =
    Browser.element { init = init, update = update, view = view, subscriptions = subscriptions }



-- MODEL


type alias Model =
    { count : Int
    , randomValue : Int
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { count = 0, randomValue = 0 }, Random.generate GenerateRandomValue probability )



-- MESSAGES


type Msg
    = Increment
    | Decrement
    | GenerateRandomValue Int
    | AddRandom



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | count = model.count + 1 }, Cmd.none )

        Decrement ->
            ( { model | count = model.count - 1 }, Cmd.none )

        GenerateRandomValue value ->
            ( { model | randomValue = value }, Cmd.none )

        AddRandom ->
            ( { model | count = model.count + model.randomValue }, Random.generate GenerateRandomValue probability )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div [ style "text-align" "center" ]
        [ button [ onClick Decrement ] [ text " --- " ]
        , div [] [ text (String.fromInt model.count) ]
        , button [ onClick Increment ] [ text " +++ " ]
        , div [] [ text ("Random Value: " ++ String.fromInt model.randomValue) ]
        , button [ onClick AddRandom ] [ text "Add Random Value" ]
        ]
