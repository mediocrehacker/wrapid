module Assets.Icons.WrapDirector exposing (..)

import Html exposing (Html)
import Svg exposing (svg, g, node)
import Svg.Attributes exposing (d, viewBox, id, height, width, fill, fillRule, stroke, strokeWidth, transform, points)

wrapDirectorIcon: Html msg
wrapDirectorIcon =
  svg [ height "30px", attribute "version" "1.1", viewBox "46 21 27 30", width "27px" ]
      [ node "desc" []
          [ text "Created with Sketch." ]
      , defs []
          []
      , Svg.path [ d "M72.982131,32.7041694 L49.9490404,32.7041694 L71.6598279,24.8060887 L70.2839179,21 L46.1786896,29.7736598 L46.1429517,29.7379219 L46.1608206,29.7915288 L46,29.8451357 L46.2501655,30.7028458 L47.0900066,35.9384514 L47.0900066,36.4030443 L47.0900066,36.5102581 L47.0900066,50.5731304 C47.0900066,50.7160821 47.3044341,50.9305096 47.4473858,50.9305096 L72.8034414,50.9305096 C72.9463931,50.9305096 73,50.7160821 73,50.5731304 L73,36.4923891 L73,36.4566512 L73,32.7041694 L72.982131,32.7041694 Z M61.2064858,36.2779616 L57.5612177,36.2779616 L61.3315685,33.2402383 L64.9768365,33.2402383 L61.2064858,36.2779616 Z M52.5757776,36.2779616 L48.75182,36.2779616 L52.5221707,33.2402383 L56.3461284,33.2402383 L52.5757776,36.2779616 Z M47.2686962,31.7035076 L48.4123097,32.9364659 L48.2514891,33.3117141 L48.2514891,33.3117141 L47.5545996,35.0450033 L46.911317,31.3103905 L47.2686962,31.7035076 Z M72.4460622,34.0800794 L69.8550629,36.2779616 L66.2097948,36.2779616 L69.9801456,33.2402383 L72.4460622,33.2402383 L72.4460622,34.0800794 Z M63.9225678,27.0754467 L60.4917273,28.326274 L55.8815354,26.7716744 L59.3123759,25.5208471 L63.9225678,27.0754467 Z M55.8100596,30.0416942 L52.2183984,31.3461284 L47.6082065,29.7915288 L51.1998676,28.4870946 L55.8100596,30.0416942 Z M68.6221046,25.3778954 L64.0119126,23.8232958 L67.4427531,22.5724686 L70.730642,23.6803441 L71.0344143,24.5023163 L68.6221046,25.3778954 Z M48.7696889,32.5790867 L51.4500331,31.6141628 L48.7696889,32.5790867 Z", fill "#FFFFFF", attribute "fill-rule" "nonzero", id "Shape", attribute "stroke" "none" ]
          []
      ]