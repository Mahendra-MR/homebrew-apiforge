cask "apiforge" do
  version "0.3.2"

  on_arm do
    sha256 "c4bed943c34f06f423b4eed4bfbd6b7c330d2f5ca9d0bcc23d0d77fd25df6c1a"
    url "https://github.com/Mahendra-MR/apiforge/releases/download/v#{version}/APIForge-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "3c681699366fba947e4e61674e4ab90333888140899d6c56b7b017ede16981e9"
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
