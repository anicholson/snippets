module Updates (Update(Resize, NoOp), update) where

{-|

@docs Update
@docs update
-}

import Model exposing (Model)

type Update = Resize (Int, Int)
            | NoOp


update : Update -> Model -> Model
update u model =
  case u of
  NoOp      -> model
  otherwise -> model