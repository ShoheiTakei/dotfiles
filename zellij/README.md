# zellij

`config.kdl` and `layouts/` belong in `~/.config/zellij/`.

## Plugins

The `.wasm` binaries are not tracked here. Install them by hand and verify the
checksum -- a release asset can be replaced upstream after the fact, so the
point of a local copy is that it stays frozen once verified.

### zellij-attention

Appends ⏳ / ✅ to the tab name when Claude Code needs input or finishes, and
clears it when the pane is focused. Because the icon lives in the tab name, the
session-manager (`Ctrl o` `w`) shows the state of tabs in other sessions too.
It holds its state in memory, draws no pane, and is fed by the Stop /
Notification hooks in `~/.claude/settings.json`.

```sh
mkdir -p ~/.config/zellij/plugins
curl -L https://github.com/KiryuuLight/zellij-attention/releases/download/v0.3.1/zellij-attention.wasm \
  -o ~/.config/zellij/plugins/zellij-attention.wasm
shasum -a 256 ~/.config/zellij/plugins/zellij-attention.wasm
```

Expected (v0.3.1):

```
4209337ab61a731448ec733362f3ef699a905bbb5c0112a93a6d616360fd722f
```
