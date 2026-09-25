cask "apiforge" do
  version "0.3.3"

  on_arm do
    sha256 "80cdb32e00d826d5427865c5c52ceaf8626b42334e63136c35a8c2e71ccb71c0"
    url "https://github.com/Mahendra-MR/apiforge/releases/download/v#{version}/APIForge-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "1ee69eaf96711f1a43e0793332cc8a1846606d0628686f20e838b2d52be43b87"
    url "https://github.com/Mahendra-MR/apiforge/releases/download/v#{version}/APIForge-#{version}-x64.dmg"
  end

  name "APIForge"
  desc "Lightweight, AI-assisted API testing and development platform"
  homepage "https://github.com/Mahendra-MR/apiforge"

  # Unsigned build (no Apple Developer account yet). Modern macOS refuses to
  # even show the old "unidentified developer -> Open Anyway" prompt for a
  # zero-signature app — it just says the app "is damaged and can't be
  # opened," which is Gatekeeper's wording for "no valid signature," not
  # actual corruption. Stripping the quarantine flag Homebrew/macOS attaches
  # on download avoids that dialog entirely, so do it automatically instead
  # of asking every user to run xattr by hand.
  app "APIForge.app"

  postflight do
    system_command "/usr/bin/xattr",
                    args: ["-cr", "#{appdir}/APIForge.app"]
  end

  zap trash: [
    "~/Library/Application Support/APIForge",
    "~/Library/Application Support/APIForge AI",
    "~/Library/Preferences/dev.apiforge.desktop.plist",
    "~/Library/Saved Application State/dev.apiforge.desktop.savedState",
  ]
end
