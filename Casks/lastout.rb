cask "lastout" do
  version "0.3.0"
  sha256 "df9c7b50ec9667aeae901c951dccf4a84d525f7fef5b3e653a67bf526a8d9e4c"

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
