cask "apiforge" do
  version "0.3.1"

  on_arm do
    sha256 "3ac0448e4193894c9f2a73b021af748b125cf5abc70810c85a9ef14c5fc79763"
    url "https://github.com/Mahendra-MR/apiforge/releases/download/v#{version}/APIForge-AI-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "0ca009f43b4eb3e17b6e490359b35e89ee92a0841c51e198cad7cc3893bb8d0d"
    url "https://github.com/Mahendra-MR/apiforge/releases/download/v#{version}/APIForge-AI-#{version}-x64.dmg"
  end

  name "APIForge AI"
  desc "Lightweight, AI-assisted API testing and development platform"
  homepage "https://github.com/Mahendra-MR/apiforge"

  # Unsigned build (no Apple Developer account yet). Modern macOS refuses to
  # even show the old "unidentified developer -> Open Anyway" prompt for a
  # zero-signature app — it just says the app "is damaged and can't be
  # opened," which is Gatekeeper's wording for "no valid signature," not
  # actual corruption. Stripping the quarantine flag Homebrew/macOS attaches
  # on download avoids that dialog entirely, so do it automatically instead
  # of asking every user to run xattr by hand.
  app "APIForge AI.app"

  postflight do
    system_command "/usr/bin/xattr",
                    args: ["-cr", "#{appdir}/APIForge AI.app"]
  end

  zap trash: [
    "~/Library/Application Support/APIForge AI",
    "~/Library/Preferences/dev.apiforge.desktop.plist",
    "~/Library/Saved Application State/dev.apiforge.desktop.savedState",
  ]
end
