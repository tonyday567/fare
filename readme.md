# fare

Fare is an independent restricted tool menu for bounded file reads, repository state, build and documentation gates, and decayed-area queries over kimi wire stores. The package has no free-agent dependency.

## commands

```text
fare read FILE [RANGE] [--head|--tail]
fare gate [ROOT] [--docspec|--docspec-full|--no-docspec]
fare state [ROOT] [--head|--tail]
fare index KEYWORD [ROOT] [--cutoff N]
```

There is no `fare search` command. Exact flags and current help are owned by `fare --help` and `fare <cmd> --help`.

## build and verification

```bash
cabal build lib:fare exe:fare exe:fare-axioma
cabal run exe:fare-axioma
cabal run exe:fare -- --help
```

`fare gate` reads the target repository's optional `.fare` file for its default docspec lane. This repository selects `repository`; linked local projects are excluded unless `--docspec-full` is explicit.
