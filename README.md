# zed-wattle

Zed extension for the [Wattle](https://github.com/zmscode/wattle) programming language.

Provides syntax highlighting, brackets, indents, and outline support via the
[`tree-sitter-wattle`](https://github.com/zmscode/tree-sitter-wattle) grammar.

## Install (dev)

```sh
zed --install-extension /path/to/this/repo
```

Or use Zed's UI: `zed: install dev extension`.

## Layout

```
extension.toml                          # extension manifest
languages/wattle/config.toml            # language config
languages/wattle/highlights.scm         # syntax highlights
languages/wattle/brackets.scm           # bracket matching
languages/wattle/indents.scm            # indent rules
languages/wattle/outline.scm            # outline view
languages/wattle/injections.scm         # foreign-language block injection
```

## License

MIT
