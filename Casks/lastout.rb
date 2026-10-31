cask "lastout" do
  version "0.4.1"
  sha256 "bb780aa219e1b224bf86d8b715e2e37e7ad0f5ecc891e5d027f24eea21d3e67e"

  url "https://github.com/Xiang-Suc/lastout-releases/releases/download/v#{version}/Lastout-#{version}.zip"
  name "Lastout"
  desc "Copy terminal command output for LLMs"
  homepage "https://github.com/Xiang-Suc/lastout-releases"

  depends_on macos: :sonoma

  app "Lastout.app"
  binary "#{appdir}/Lastout.app/Contents/Helpers/lo"
  binary "#{appdir}/Lastout.app/Contents/Helpers/lastout-shell"

  uninstall quit: "dev.lastout.app"

  zap trash: [
    "~/Library/Application Support/lastout",
    "~/Library/Preferences/dev.lastout.app.plist",
  ]

  caveats "Run `lo setup` (or open Lastout) to record your terminals; `lo setup --uninstall` removes it."
end
