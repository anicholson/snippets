module Model (Model, defaultModel) where

{-|

# Application Model

@docs Model

# Utility functions

@docs defaultModel

-}

{-|-}
type alias Model = {
      window : {
        width: Int
      , tabs : List Tab
      }

    , snippets : List Snippet
    }

type alias Tag = String
type alias URL = String

{-| The definition of a Snippet. Has a title, some content, a list of tags, and an optional referring URL. -}

type alias Snippet = {
      title : String
    , content : String
    , tags: List Tag
    , referringURL : Maybe URL
    }

type alias TabState = {
      hidden : Bool
    , active : Bool
    }

defaultTabState : TabState
defaultTabState = {
  hidden = False,
  active = False }

activeTabState : TabState
activeTabState = {
  hidden = False,
  active = True }

type alias Tab = {
      name : String
    , state : TabState }


{-|

Returns the default, beginning state of the application.

-}
defaultModel : Model
defaultModel = {
  window = {
    width = 960,
    tabs = [
     { name = "Snippets", state = activeTabState }
    ,{ name = "Admin", state = defaultTabState }]}
  , snippets = [{
    title = "Example Snippet",
    content = "The stuff that goes in the snippet",
    tags = ["example"],
    referringURL = Nothing
  }]}
