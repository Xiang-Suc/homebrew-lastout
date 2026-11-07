cask "lastout" do
  version "0.4.2"
  sha256 "44df49c282ff924891a8faadae82ee244bc15cffad68daa6ac9d1a0af08cbf7f"

  url "https://github.com/Xiang-Suc/lastout-releases/releases/download/v#{version}/Lastout-#{version}.zip"
  name "Lastout"
  desc "Copy terminal command output for LLMs"
  homepage "https://lastout.dev/"

  livecheck do
    url "https://github.com/Xiang-Suc/lastout-releases/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Lastout.app"
  binary "#{appdir}/Lastout.app/Contents/Helpers/lo"
  binary "#{appdir}/Lastout.app/Contents/Helpers/lastout-shell"

  uninstall quit: "dev.lastout.app"

  zap trash: [
    "~/Library/Application Support/lastout",
    "~/Library/Preferences/dev.lastout.app.plist",
  ]

  caveats <<~EOS
    Open Lastout once: it starts the trial and offers Set Up, which records your terminals.
    The shortcuts, `lo search`, `lo save` and `lo mcp` need the app running.
    `lo setup --uninstall` removes the shell setup.
  EOS
end
