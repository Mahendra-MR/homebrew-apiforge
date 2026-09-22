# homebrew-apiforge

A [Homebrew tap](https://docs.brew.sh/Taps) for [APIForge AI](https://github.com/Mahendra-MR/apiforge), a lightweight, AI-assisted API testing and development platform (a leaner alternative to Postman with an integrated AI assistant).

## Install

```bash
brew tap Mahendra-MR/apiforge
brew install --cask apiforge
```

This installs **APIForge AI.app** into `/Applications`, built for macOS from the [apiforge](https://github.com/Mahendra-MR/apiforge) repo via GitHub Actions on a real macOS runner (both Apple Silicon and Intel builds are published).

## Unsigned build — first launch needs one extra step

This app isn't code-signed or notarized (no Apple Developer account yet). macOS Gatekeeper will block the very first launch. To get past it (one-time, per machine):

- Right-click (or Control-click) the app in `/Applications` and choose **Open**, then confirm in the dialog that appears, **or**
- Go to **System Settings → Privacy & Security**, and click **"Open Anyway"** next to the blocked-app notice, after the first blocked attempt.

## Uninstall

```bash
brew uninstall --cask apiforge
# to also remove its data/preferences:
brew uninstall --zap --cask apiforge
```

## Updating this tap for a new release

The [apiforge](https://github.com/Mahendra-MR/apiforge) repo has a GitHub Actions workflow (`.github/workflows/release.yml`) that builds and publishes a GitHub Release automatically whenever a `vX.Y.Z` tag is pushed there. After a new release is published:

1. Note the new version and download the two `.dmg` release assets (or just compute checksums straight from the published URLs).
2. Compute their checksums:
   ```bash
   shasum -a 256 APIForge-AI-<version>-arm64.dmg
   shasum -a 256 APIForge-AI-<version>-x64.dmg
   ```
3. In `Casks/apiforge.rb`, bump `version` and update both `sha256` values.
4. Commit and push to this repo.
