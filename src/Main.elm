port module Main exposing (main)

import Html exposing (Html, a, button, div, h1, h4, img, li, p, text, ul)
import Html.Attributes exposing (href, src, style)
import Html.Events exposing (onClick)
import Navigation as Nav
import Maybe exposing (andThen)

import Client.Generic.Authentication.Login.Login as Login exposing (loginView, Msg)
import Client.ExtraPortal.ExtraPortal as ExtraPortal exposing (..)
import Client.PAPortal.PAPortal as PAPortal exposing (..)

main : Program Never Model Msg
main =
    Nav.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL

type alias Model =
    { history : List Nav.Location
    , currentImg : Maybe String
    , currentModelView : ModelView
    , title: String
    }

type ViewState = LoginView | ExtraPortalView | PAPortalView
type alias ViewModel =  PAPortal.Model
type alias ModelView = {model: ViewModel, viewState: ViewState}


type alias Url =
    String

type alias Profile =
    { id : String
    , firstName : String
    , url : Maybe String
    }




defaultModelView: ModelView
defaultModelView = {model = (PAPortal.initModel "meow"), viewState=LoginView}
init : Nav.Location -> ( Model, Cmd Msg )
init location =
    ( Model [ location ] Nothing defaultModelView "Yo"
    , Cmd.none
    )

-- UPDATE


type Msg
    = UrlChange Nav.Location
    | LoginMsg Login.Msg
    | ChangeView ViewState
    | ExtraPortalMsg ExtraPortal.Msg
    | PAPortalMsg PAPortal.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeView viewState ->
          let
              currentModelView = {model = model.currentModelView.model, viewState = viewState}
          in
              ({model | currentModelView = currentModelView}, Cmd.none)
        UrlChange location ->
            ( { model | history = location :: model.history }
            , Cmd.none
            )
        LoginMsg loginMsg -> (model, Cmd.none)
        ExtraPortalMsg epMsg -> (model, Cmd.none)
        PAPortalMsg paMsg ->
          let
            (paPortalModel, paCmd) = PAPortal.update paMsg model.currentModelView.model

            currentModelView = {model = paPortalModel, viewState = model.currentModelView.viewState}
          in
            ({model | currentModelView = currentModelView}, Cmd.map (\b -> PAPortalMsg b) paCmd)


view : Model -> Html Msg
view model =
    div []
    [
      case model.currentModelView.viewState of
          LoginView -> Html.map LoginMsg (Login.loginView Nothing)
          ExtraPortalView -> Html.map ExtraPortalMsg (ExtraPortal.viewExtraPortal {profile = {firstName = "Steve"}})
          PAPortalView -> Html.map PAPortalMsg
                  (PAPortal.viewPAPortal model.currentModelView.model)
      , div [style [("position", "fixed"), ("bottom", "0px"), ("border", "1px solid black")]]
      [
          div [] [
                ul [] (List.map viewLink [ "bears" ])
              , h4 [] [ text "History" ]
              , ul [] (List.map viewLocation model.history)
              ]
        , button [onClick (ChangeView ExtraPortalView)] [text "Extra Portal"]
        , button [onClick (ChangeView PAPortalView)] [text "PA Portal"]
        , button [onClick (ChangeView LoginView)] [text "Login"]
      ]
    ]



viewLink : String -> Html msg
viewLink name =
    li [] [ a [ href ("#" ++ name) ] [ text name ] ]


viewLocation : Nav.Location -> Html msg
viewLocation location =
    li [] [ text (location.pathname ++ location.hash) ]



-- PORTS


-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
    [
      Sub.map (\pas -> PAPortalMsg pas) (PAPortal.subscriptions model.currentModelView.model)
    ]
