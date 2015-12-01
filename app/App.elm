module App where

{-|

# Snippets

A grab-bag of "oh, I should remember that!" moments, written in Elm.

## Where to find things

- Views.Elm: start here for HTML templates, etc.
- Styles.Elm: style definitions we'll use in the app
- Updates.elm: definitions of events that change things

-}

import Model exposing (Model, defaultModel)
import Views
import Updates

import Html

main : Signal Html.Html
main = Signal.map Views.mainView Updates.appModel
