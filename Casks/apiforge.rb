cask "apiforge" do
  version "0.1.0"

  on_arm do
    sha256 "be68997df3433d384fa33f5dc008684b9ce0084901d90bb9bde0efa60f241031"
    url "https://github.com/Mahendra-MR/apiforge/releases/download/v#{version}/APIForge-AI-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "73e653ec621ca6eaebab32940e37ad9031306221523d09561966696fa6e8d0ba"
    url "https://github.com/Mahendra-MR/apiforge/releases/download/v#{version}/APIForge-AI-#{version}-x64.dmg"
  end

  name "APIForge AI"
  desc "Lightweight, AI-assisted API testing and development platform"
  homepage "https://github.com/Mahendra-MR/apiforge"

  # Unsigned build (no Apple Developer account yet) — Homebrew installs it
  # fine, but macOS Gatekeeper still blocks the first launch. Users need to
  # right-click the app -> Open (or System Settings -> Privacy & Security ->
  # "Open Anyway") once. There is no cask-level way around this without
  # signing and notarizing the build.
  app "APIForge AI.app"

  zap trash: [
    "~/Library/Application Support/APIForge AI",
    "~/Library/Preferences/dev.apiforge.desktop.plist",
    "~/Library/Saved Application State/dev.apiforge.desktop.savedState",
  ]
end
