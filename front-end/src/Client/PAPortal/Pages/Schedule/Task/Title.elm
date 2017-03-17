module Client.PAPortal.Pages.Schedule.Task.Title exposing (..)

import Html
import Html exposing (Html)

import Common.Renderable as Renderable
import Common.Renderable exposing (Renderable)

import Html.Attributes as Attr

type alias Data = String
type alias Title msg = Renderable Data (Html msg) {}

create : Data -> Title msg
create = Renderable.create render

render : Data -> Html msg
render data = Html.text data
    
input : Data -> Html msg
input data =
    let attributes = [ Attr.type_ "text"
                     , Attr.name "title"
                     , Attr.value data
                     ]
    in Html.input attributes []
