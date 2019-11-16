module Test.Main where

import Prelude

import Effect (Effect)
import Main (Result(..), Shape(..), jankenpon)
import Test.Unit (test)
import Test.Unit.Assert (shouldEqual)
import Test.Unit.Main (runTest)

main :: Effect Unit
main = runTest do
  test "JanKenPon" do
    (jankenpon Rock Rock) `shouldEqual` Draw
    (jankenpon Rock Paper) `shouldEqual` PaperWins
    (jankenpon Rock Scissors) `shouldEqual` RockWins

    (jankenpon Paper Rock) `shouldEqual` PaperWins
    (jankenpon Paper Paper) `shouldEqual` Draw
    (jankenpon Paper Scissors) `shouldEqual` ScissorsWins

    (jankenpon Scissors Rock) `shouldEqual` RockWins
    (jankenpon Scissors Paper) `shouldEqual` ScissorsWins
    (jankenpon Scissors Scissors) `shouldEqual` Draw