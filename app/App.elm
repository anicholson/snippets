module App where

{-|

# Snippets

A grab-bag of "oh, I should remember that!" moments, written in Elm.

## Where to find things

- Views.Elm: start here for HTML templates, etc.
- Styles.Elm: style definitions we'll use in the app
- Updates.elm: definitions of events that change things

-}

import Views
import Updates
import Model exposing (Model, defaultModel)
import Html


updates : Signal.Mailbox Updates.Update
updates = Signal.mailbox Updates.NoOp

appModel : Signal Model
appModel =
  let
    applicationUpdates = updates.signal
  in
    Signal.foldp Updates.update Model.defaultModel applicationUpdates

main : Signal Html.Html
main = Signal.map Views.mainView appModel

