module Updates (Update(Resize, NoOp), update, appModel) where

{-|

@docs Update
@docs update
-}

import Window

import Model exposing (Model)
import Debug exposing (log)

type Update = Resize (Int, Int)
            | NoOp



updates : Signal.Mailbox Update
updates = Signal.mailbox NoOp

appModel : Signal Model
appModel =
  let
    applicationUpdates = Signal.mergeMany
                         [ updates.signal
                         , Signal.map Resize Window.dimensions
                         ]
  in
    Signal.foldp update Model.defaultModel applicationUpdates


update : Update -> Model -> Model
update u model =
    let windowUpdate = \windowModel -> \w -> { windowModel | width  = w }
    in
      case u of
        Resize (w, _) -> { model | window = windowUpdate model.window w }
        otherwise -> model
