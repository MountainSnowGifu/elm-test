module Main2 exposing (floatingLabel)

import Css
import Css.Global
import Css.Transitions exposing (transition)
import Html.Styled as HtmlStyled exposing (Html)
import Html.Styled.Attributes as HtmlStyledAttributes


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
