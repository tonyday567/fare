-- | Shared assertion for fare oracle topics.
module Axioma.Common (assert) where

import System.Exit (exitFailure)

assert :: String -> Bool -> IO ()
assert msg ok =
  if ok
    then putStrLn ("  PASS " ++ msg)
    else do
      putStrLn ("  FAIL " ++ msg)
      exitFailure
