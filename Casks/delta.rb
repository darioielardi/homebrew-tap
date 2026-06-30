cask "delta" do
  version "0.7.0"
  sha256 "771010d5e6b85798bcf9d220b0b381a78c1fcc8a5c153d44673db1cc54d01b61"

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
