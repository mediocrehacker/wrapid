module Common.WrapidLogo exposing (logo)

import Svg exposing (..)
import Svg.Attributes exposing (..)
import Html exposing (Html, div)
import Html.Attributes exposing (style)


logo : Html msg
logo =
    div [ Html.Attributes.style [ ( "display", "flex" ), ( "align-items", "center" ) ] ]
        [ svg [ height "27px", viewBox "79 72 52 27", width "52px" ]
            [ g [ fill "none", fillRule "evenodd", id "W-logo", stroke "none", strokeWidth "1", transform "translate(79.000000, 72.000000)" ]
                [ node "rect"
                    [ fill "#FF4600", height "24", id "Rectangle-3-Copy-4", transform "translate(38.727922, 13.183766) rotate(45.000000) translate(-38.727922, -13.183766) ", width "12", x "32.7279221", y "1.18376618" ]
                    []
                , node "polygon"
                    [ fill "white", id "Rectangle-3-Copy-6", points "7 2 19.0009793 2.00097933 19.002938 26.002938 7.00195867 26.0019587", transform "translate(13.001469, 14.001469) rotate(-45.000000) translate(-13.001469, -14.001469) " ]
                    []
                , node "polygon"
                    [ fill "white", id "Rectangle-3-Copy-5", points "17 9.48528137 25.4852814 1 42.4558441 17.9705627 33.9705627 26.4558441" ]
                    []
                ]
            ]
        , div [ Html.Attributes.style [ ( "margin-left", "4px" ) ] ]
            [ svg [ height "19px", viewBox "68 8 86 19", width "86px" ]
                [ Svg.path [ d "M73.77215,17.054 L76.74395,8 L78.76325,8 L81.73505,17.054 L85.08785,8 L87.5072,8 L82.859,20.582 L80.63015,20.582 L77.8298,11.96 L77.6774,11.96 L74.87705,20.582 L72.6482,20.582 L68,8 L70.41935,8 L73.77215,17.054 Z M101.271883,12.086 C101.271883,14.1620104 100.313043,15.4699973 98.3953333,16.01 L101.881483,20.582 L99.0239833,20.582 L95.8426333,16.352 L92.8898833,16.352 L92.8898833,20.582 L90.6419833,20.582 L90.6419833,8 L95.5949833,8 C97.6269935,8 99.081129,8.32399676 99.9574333,8.972 C100.833738,9.62000324 101.271883,10.6579929 101.271883,12.086 Z M98.2810333,13.868 C98.7382356,13.4959981 98.9668333,12.8990041 98.9668333,12.077 C98.9668333,11.2549959 98.7318857,10.6910015 98.2619833,10.385 C97.792081,10.0789985 96.9538894,9.926 95.7473833,9.926 L92.8898833,9.926 L92.8898833,14.426 L95.6902333,14.426 C96.9602397,14.426 97.823831,14.2400019 98.2810333,13.868 Z M107.454667,17.72 L106.121167,20.582 L103.720867,20.582 L109.588267,8 L111.988567,8 L117.855967,20.582 L115.455667,20.582 L114.122167,17.72 L107.454667,17.72 Z M113.207767,15.758 L110.788417,10.574 L108.369067,15.758 L113.207767,15.758 Z M129.75375,9.098 C130.680855,9.83000366 131.1444,10.9579924 131.1444,12.482 C131.1444,14.0060076 130.67133,15.1219965 129.725175,15.83 C128.77902,16.5380035 127.32806,16.892 125.37225,16.892 L123.01005,16.892 L123.01005,20.582 L120.76215,20.582 L120.76215,8 L125.33415,8 C127.35346,8 128.826645,8.36599634 129.75375,9.098 Z M128.163075,14.291 C128.613927,13.8409977 128.83935,13.1810043 128.83935,12.311 C128.83935,11.4409956 128.553603,10.8260018 127.9821,10.466 C127.410597,10.1059982 126.515256,9.926 125.29605,9.926 L123.01005,9.926 L123.01005,14.966 L125.6199,14.966 C126.864506,14.966 127.712223,14.7410022 128.163075,14.291 Z M134.850683,8 L137.098583,8 L137.098583,20.582 L134.850683,20.582 L134.850683,8 Z M151.930067,9.647 C153.212773,10.7450055 153.854117,12.2719902 153.854117,14.228 C153.854117,16.1840098 153.231823,17.7319943 151.987217,18.872 C150.74261,20.0120057 148.837629,20.582 146.272217,20.582 L141.852617,20.582 L141.852617,8 L146.424617,8 C148.812229,8 150.64736,8.54899451 151.930067,9.647 Z M151.587167,14.282 C151.587167,11.4019856 149.840934,9.962 146.348417,9.962 L144.100517,9.962 L144.100517,18.584 L146.596067,18.584 C148.208975,18.584 149.444037,18.2210036 150.301292,17.495 C151.158546,16.7689964 151.587167,15.6980071 151.587167,14.282 Z"
                , fill "white", fillRule "evenodd", id "WRAPID", stroke "none" ]
                    []
                , node "rect"
                    [ fill "white", fillRule "evenodd", height "2", id "Rectangle-4", stroke "none", width "11.6416667", x "72", y "25" ]
                    []
                ]
            ]
        ]
