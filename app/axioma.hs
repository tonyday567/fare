-- | fare oracle tests.
module Main (main) where

import Axioma.Fare (fareTopic)

main :: IO ()
main = do
  putStrLn "fare oracle tests"
  fareTopic
  putStrLn "All tests passed"
