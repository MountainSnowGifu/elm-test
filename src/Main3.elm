module Main3 exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--

import Browser
import Css
import Css.Global
import Css.Transitions exposing (transition)
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Html.Styled as HtmlStyled exposing (Html)
import Html.Styled.Attributes as HtmlStyledAttributes
import Random


floatingLabel : Html msg
floatingLabel =
    HtmlStyled.div
        [ HtmlStyledAttributes.css
            [ Css.position Css.relative
            , Css.Global.descendants
                [ Css.Global.selector ".floating-label__input:not(:placeholder-shown) + label"
                    [ Css.backgroundColor <| Css.hex "ffffff"
                    , Css.transform <| Css.translate2 Css.zero (Css.pct -50)
                    , Css.opacity <| Css.num 1
                    ]
                ]
            ]
        ]
        [ HtmlStyled.input
            [ HtmlStyledAttributes.class "floating-label__input"
            , HtmlStyledAttributes.placeholder "Placeholder"
            , HtmlStyledAttributes.css
                [ Css.padding <| Css.px 8
                , Css.borderRadius <| Css.px 4
                , Css.border3 (Css.px 1) Css.solid (Css.hex "efefef")
                ]
            ]
            []
        , HtmlStyled.label
            [ HtmlStyledAttributes.class "floating-label__label"
            , HtmlStyledAttributes.css
                [ Css.position Css.absolute
                , Css.left <| Css.px 8
                , Css.top <| Css.px 0
                , Css.opacity Css.zero
                , Css.pointerEvents Css.none
                , transition
                    [ Css.Transitions.opacity 200
                    , Css.Transitions.transform 200
                    ]
                ]
            ]
            [ HtmlStyled.text "Placeholder" ]
        ]


probability : Random.Generator Float
probability =
    Random.float 0 1



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    Int


init : Model
init =
    0



-- UPDATE


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text " --- " ]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Increment ] [ text " +++ " ]
        ]
