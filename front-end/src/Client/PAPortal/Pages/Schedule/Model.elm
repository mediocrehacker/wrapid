module Client.PAPortal.Pages.Schedule.Model exposing (..)
import Client.PAPortal.Pages.Schedule.Message exposing (..)
import Client.PAPortal.Pages.Schedule.Task as Task

--MODEL
type alias Model msg =  { task : Maybe (Task.Task msg)
                        , modals : List Modal
                        }

    
initModel: Model msg
initModel = { task = Nothing
            , modals = []
            }