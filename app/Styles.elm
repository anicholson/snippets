module Styles (column, centered, flex, appColors) where

{-|

# Parent containers
@docs flex

# Flex-related styles
@docs centered
@docs column

# Width-related

# Colours
@docs appColors
-}

import Css exposing (Styles, setViewport)
import Css.Flex as Flex
import Css.Display as Display exposing (display)
import Css.Shadow as Shadow
import Css.Background as Background
import Css.Text as Text
import Css.Font as Font
import Css.Padding as Padding
import Css.Dimension as Dimension
import Css.Margin as Margin
import Color as Color exposing (rgba)

import Window


{-|  Set the display as a flex container -}
flex : Styles -> Styles
flex styles =
  display Display.Flex styles


{-|  Sets items in parent container to flex in a justified, centered manner.  -}
centered : Styles -> Styles
centered styles =
  styles
    |> Flex.justifyContent Flex.JCCenter
    |> Flex.alignItems Flex.AICenter


{-|  Sets the flow direction of the flex container to column -}
column : Styles -> Styles
column styles =
  Flex.direction Flex.Column styles


{-|-}
type alias AppColors = {
    primary: Color.Color
  , secondary: Color.Color
}

{-| Application colour definitions -}
appColors: AppColors
appColors = {
    primary = rgba 255 0 0 1
  , secondary = rgba 255 255 255 1 }