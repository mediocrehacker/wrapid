module Assets.Icons.SearchIcon exposing (..)

import Html exposing (Html)
import Svg exposing (svg, g, node)
import Svg.Attributes exposing (d, viewBox, id, height, width, fill, fillRule, stroke, strokeWidth, transform, points)

viewSearchIcon: Html msg
viewSearchIcon =
  svg [ height "24px", viewBox "16 64 24 24", width "24px" ]
    [g [ fill "none", fillRule "evenodd", id "ic_search_black_24px-(1)", stroke "none", strokeWidth "1", transform "translate(16.000000, 64.000000)" ]
        [ node "polygon" [ id "Shape", points "0 0 24 0 24 24 0 24" ]
            []
        , Svg.path [ d "M15.5,14 L14.71,14 L14.43,13.73 C15.41,12.59 16,11.11 16,9.5 C16,5.91 13.09,3 9.5,3 C5.91,3 3,5.91 3,9.5 C3,13.09 5.91,16 9.5,16 C11.11,16 12.59,15.41 13.73,14.43 L14,14.71 L14,15.5 L19,20.49 L20.49,19 L15.5,14 L15.5,14 Z M9.5,14 C7.01,14 5,11.99 5,9.5 C5,7.01 7.01,5 9.5,5 C11.99,5 14,7.01 14,9.5 C14,11.99 11.99,14 9.5,14 Z", fill "#45494E", id "Shape" ]
            []
        ]
    ]
