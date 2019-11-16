module Main (
    Shape(..),
    Result(..),
    jankenpon
) where

import Prelude

data Shape = Rock
    | Paper
    | Scissors
    | Error

derive instance shapeEq :: Eq Shape

data Result = Draw
    | RockWins
    | PaperWins
    | ScissorsWins
    | ShouldNotHappen

derive instance resultEq :: Eq Result
instance resultShow :: Show Result where
  show Draw = "Draw"
  show RockWins = "Rock Wins"
  show PaperWins = "Paper Wins"
  show ScissorsWins = "Scissor Wins"
  show ShouldNotHappen = "Should not happen"


jankenpon :: Shape -> Shape -> Result
jankenpon Rock Paper = PaperWins
jankenpon Paper Scissors = ScissorsWins
jankenpon Scissors Rock = RockWins
jankenpon one other =
    if one == other
    then Draw
    else jankenpon other one
