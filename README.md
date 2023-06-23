# `cabal-explain`

`cabal-explain` is a utility tool inspired by `rustc --explain`. It brings similar functionality to Haskell, allowing you to display explanations for Haskell error messages directly from your terminal. This utility leverages [the recently added plugin functionality](https://github.com/haskell/cabal/pull/9063) in `cabal-install`, enabling its use as a `cabal explain` subcommand.

`cabal-explain` fetches explanations from the [Haskell Foundation's error-message-index](https://github.com/haskellfoundation/error-message-index) using `curl` and employs `lowdown` to display the content, formatted with ANSI color codes, in a user-friendly manner on your terminal.

Although this functionality can be replicated with the following shell alias:

```bash
alias cabal-explain='curl "https://raw.githubusercontent.com/haskellfoundation/error-message-index/main/message-index/messages/$1/index.md" | lowdown -tterm'
```

I am distributing `cabal-explain` as a Nix flake for your convenience :)

## Installation

You can install `cabal-explain` by running the following command:

```
nix profile install "github:yvan-sraka/cabal-explain"
```

## Usage

Using `cabal-explain` is straightforward. Once installed, simply use the `cabal explain` command followed by the error message code about which you need more information:

```
cabal explain <error-message-code>
```
