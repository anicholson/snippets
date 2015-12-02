module Views where

import Styles exposing (flex, column, centered, appColors)
import Model exposing (Model, Snippet)
import Window

import Html exposing (Html, a, div, h1, header, text, pre, ul, li,  section)
import Html.Attributes as Attributes exposing (href, class, style, id)

import Css.Background as Background
import Css.Text       as Text
import Css.Dimension  as Dimension
import Css.Margin     as Margin

import Bootstrap.Html as B

navigationView: Model -> Html
navigationView model =
  let activeClass = \tab -> if tab.state.active then "active" else ""
      visibleTab  = \tab -> if tab.state.hidden then False else True
      tabView = \tab -> if visibleTab(tab) then (li [class (activeClass tab)] [ a [href "#"] [text tab.name]]) else (text "")
  in
    div [class "header"] [
             B.navbarDefault' "" [
                   B.navbarHeader_ [
                         ul [class "nav navbar-nav"] (List.map tabView model.window.tabs) ] ] ]


headerView: Model -> Html
headerView model =
  let width  = model.window.width
      styles = Dimension.width width []
      headline = h1 [] [ text "Snippets" ]
  in  header
        [ (id "header"), style <| styles ]
          [
           navigationView(model),
           headline ]


snippetView : Snippet -> Html
snippetView snippet =
    div [] [(h1 [] [text snippet.title]),
             (div [] [ pre [ class "prettyprint linenums" ] [text snippet.content]])]

bodyView: Model -> Html
bodyView model =
  let width = model.window.width
  in
    section [] <| List.map snippetView model.snippets


mainView : Model -> Html
mainView model =
  div
    [ style <| centered <| column <| flex [] ]
    <| [headerView(model), bodyView(model)]
