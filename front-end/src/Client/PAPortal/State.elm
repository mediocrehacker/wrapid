module Client.PAPortal.State exposing (..)

import Client.PAPortal.Types as PATypes exposing (..)
import Client.PAPortal.Pages.SkinManager as Skin
import Client.PAPortal.Pages.Wrap as Wrap
import Client.PAPortal.Pages.LiveMonitor as LiveMonitor
import Client.PAPortal.Pages.SkinUploadPage as SkinUploadPage
import Client.Utilities.DateTime exposing (frmtDate)
import Common.Types.Skin as Common exposing (Skin)
import Ports exposing (..)
import Server.API.Mutations.SkinMutations as Server exposing (uploadSkin, receiveUploadedSkin)

import Date exposing (Date)
import Task exposing (perform, succeed)
import Material

type alias Model =
  {
    currentDate: Maybe Date
  , selectedDate: SelectedDate
  , user: PAProfile
  , extraInfo: RemoteData (List ExtraInfo)
  -- , extraActivity: RemoteData (List ExtraActivity)
  , currentView: ViewState
  , currentSkin: Maybe Common.Skin
  , skinModel : Skin.Model
  , wrapModel : Wrap.Model
  , liveModel : LiveMonitorState
  , mdl : Material.Model
  }


type Msg
    = ChangeView ViewState
    | LoadRemoteData
    | SetSelectedDate Date
    | ReceiveExtraInfo (List ExtraInfo)
    | ReceiveDailySkin (Maybe Common.Skin)
    | SkinMsg Skin.Msg
    | WrapMsg Wrap.Msg
    | LiveMsg LiveMonitorMsg
    | SkinUploadPageMsg SkinUploadPage.Msg
    | ReceiveFileSkinUpload Common.Skin


initModel: String -> Maybe Date -> Maybe SelectedDate -> Material.Model -> (Model, Cmd Msg)
initModel userId currentDate selectedDate materialModel =
  let
    user =
      {id=userId
      , firstName="Jeff"
      , lastName="PaGuy"
      , avatarSrc=Just "https://files.graph.cool/ciykpioqm1wl00120k2e8s4la/ciyvfw6ab423z01890up60nza"
      }
  in
    (
    { user = user
    , extraInfo = Loading
    , currentDate = currentDate
    , selectedDate =
        case selectedDate of
          Just date -> date
          Nothing -> currentDate
    , currentView = Initializing
    , currentSkin = Nothing
    , skinModel = Skin.initModel Nothing (frmtDate currentDate)
    , wrapModel = Wrap.initModel
    , liveModel = LiveMonitor.initState materialModel
    , mdl = materialModel
    }
    , Task.perform (always LoadRemoteData) (Task.succeed ())
    )

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeView view ->
            ( { model | currentView = view }, Cmd.none )
        LoadRemoteData ->
            let
              date = frmtDate model.currentDate
              l = Debug.log "DATE!!!!!!: " date
            in
              (model, fetchDailySkin(date))
        SetSelectedDate newDate ->
          initModel model.user.id (model.currentDate) (Just (Just newDate)) model.mdl
        ReceiveExtraInfo extraInfo ->
            ({model | extraInfo = Success extraInfo}, Cmd.none)

        ReceiveDailySkin skin ->
          let
              newView =
                case skin of
                  Just skin -> SkinManager
                  Nothing -> SkinUploadPage

              date = frmtDate model.currentDate
              dLog = Debug.log "d: " date
          in

          ({model |
            currentSkin = skin
            , currentView = newView
            , skinModel=Skin.initModel skin date}
            , getAllExtraInfo(date)
          )

        SkinMsg subMsg ->
            let
                ( updatedSkinModel, skinCmd ) =
                    Skin.update subMsg model.skinModel

                dateStr = frmtDate model.currentDate
            in
                ( { model | skinModel = updatedSkinModel }
                , case subMsg of
                    Skin.UploadSkin ->
                      let
                          roleLog = Debug.log "SKIN!!: " (Skin.rolesToSkin updatedSkinModel.roles dateStr)
                      in
                          Server.uploadSkin (Skin.rolesToSkin updatedSkinModel.roles dateStr)
                    _ -> Cmd.none
                )
        WrapMsg subMsg ->
          let
              updatedWrapModel =
                  Wrap.update subMsg model.wrapModel
          in
              ( { model | wrapModel = updatedWrapModel }
              , Cmd.none
              )
        LiveMsg subMsg ->
          let
              (updatedLMModel, lmCmd) =
                  LiveMonitor.update subMsg model.liveModel

              log3 = Debug.log "Schedule Item" model.liveModel.roleScheduler.scheduleItem
          in
              ( { model | liveModel = updatedLMModel }
              , case subMsg of
                  SubmitTaskByRole item ->
                    addScheduleItem("meow", model.liveModel.roleScheduler.scheduleItem)
                  _ -> Cmd.none
              )
        SkinUploadPageMsg subMsg ->
          case Debug.log "msg" subMsg of
            SkinUploadPage.CreateSkin ->
              let
                  l = Debug.log "cREATE SKIN!!!" subMsg
              in
                ({model | currentView=SkinManager}, Cmd.none)
            SkinUploadPage.UploadSkin ->
                (model, uploadSkinCSV("NodeSkinCSVUpload", frmtDate model.currentDate))
        ReceiveFileSkinUpload skin ->
          let
            l = Debug.log "Skin!" skin
          in
            (model, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.batch
  [receiveAllExtraInfo ReceiveExtraInfo
  ,receiveDailySkin ReceiveDailySkin
  ,receiveFileSkinUpload ReceiveFileSkinUpload
  ]
