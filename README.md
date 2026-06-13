# homebrew-coremetrics

Homebrew tap for [coremetrics](https://github.com/sviatil0/coremetrics).

## Install

```bash
brew tap sviatil0/coremetrics
brew install coremetrics
```

## Run

```bash
coremetrics                  # live UI, exits with the in-window button, Ctrl-C, or SIGTERM
coremetrics --duration 5     # exits cleanly after 5 seconds
coremetrics --sparklines     # adds rolling CPU / RAM / GPU charts to the System tab
coremetrics --screenshot out.png            # headless: render one frame to disk
coremetrics --screenshot out.png processes  # same, Processes tab
```

## Updating the formula after a new upstream release

After the upstream `release.yml` workflow finishes for a new tag `vX.Y.Z`:

```bash
for arch in macos-arm64 macos-x86_64 linux-x86_64; do
  curl -L -o /tmp/coremetrics-vX.Y.Z-$arch.tar.gz \
    https://github.com/sviatil0/coremetrics/releases/download/vX.Y.Z/coremetrics-vX.Y.Z-$arch.tar.gz
  shasum -a 256 /tmp/coremetrics-vX.Y.Z-$arch.tar.gz
done
```

Paste the three SHA256s and the new version into `Formula/coremetrics.rb`, commit, push.
