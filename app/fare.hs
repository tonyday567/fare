-- | fare — restricted equipment: a parsimonious tool menu.
--
--   fare read FILE [RANGE] [--head|--tail]
--   fare gate [ROOT] [--docspec|--docspec-full|--no-docspec]
--   fare state [ROOT] [--head|--tail]
--   fare index KEYWORD [ROOT] [--cutoff N]
--   fare --version
module Main (main) where

import Data.Version (showVersion)
import Fare.Cli (fareParser, runFareCommand)
import Options.Applicative
  ( Parser,
    customExecParser,
    fullDesc,
    header,
    help,
    helper,
    info,
    infoOption,
    long,
    prefs,
    progDesc,
    short,
    showHelpOnError,
    (<**>),
  )
import Paths_fare (version)

main :: IO ()
main = do
  cmd <- customExecParser (prefs showHelpOnError) opts
  runFareCommand cmd
  where
    opts =
      info
        ((fareParser <**> helper) <**> versionOption)
        ( fullDesc
            <> progDesc "Restricted, curated tool menu for agent seats"
            <> header "fare - restricted equipment"
        )

-- | The build witness: which fare produced a verdict. Answers with the
-- package version the binary was linked from and exits 0.
versionOption :: Parser (a -> a)
versionOption =
  infoOption
    ("fare " <> showVersion version)
    ( long "version"
        <> short 'V'
        <> help "Print the build version and exit"
    )
