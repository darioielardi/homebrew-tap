cask "delta" do
  version "0.6.0"
  sha256 "efd6991b12dc6458831f8e265d0590011a29dad8d509a9be3c2740ff7e04e761"

  url "https://github.com/darioielardi/delta/releases/download/v#{version}/Delta_#{version}_aarch64.dmg"
  name "Delta"
  desc "Desktop app for reviewing git diffs with structured comments for AI agents"
  homepage "https://github.com/darioielardi/delta"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Delta.app"

  zap trash: [
    "~/Library/Application Support/com.darioielardi.delta",
    "~/Library/Caches/com.darioielardi.delta",
    "~/Library/HTTPStorages/com.darioielardi.delta",
    "~/Library/Preferences/com.darioielardi.delta.plist",
    "~/Library/Saved Application State/com.darioielardi.delta.savedState",
    "~/Library/WebKit/com.darioielardi.delta",
  ]
end
