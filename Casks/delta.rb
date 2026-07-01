cask "delta" do
  version "0.10.0"
  sha256 "10c8ef1f2741c2730110f5d413f21ae0eea3c787eb88437170ff9a46a01fedbc"

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
  binary "#{appdir}/Delta.app/Contents/MacOS/Delta", target: "delta"

  # An earlier build's in-app "Install CLI" self-symlinked `delta` onto PATH,
  # pointing into the app bundle. Homebrew refuses to overwrite that foreign
  # symlink and would skip linking its own `delta` (the binary stanza above).
  # preflight runs before artifacts are linked regardless of stanza position, so
  # clearing the stale link here lets Homebrew's `delta` link land. Only remove
  # links that resolve into a Delta.app bundle — never git-delta (a Cellar path).
  preflight do
    ["/usr/local/bin/delta", "/opt/homebrew/bin/delta", "#{Dir.home}/.local/bin/delta"].each do |p|
      next unless File.symlink?(p)

      FileUtils.rm(p) if File.readlink(p).include?("/Delta.app/")
    end
  end

  zap trash: [
    "~/Library/Application Support/com.darioielardi.delta",
    "~/Library/Caches/com.darioielardi.delta",
    "~/Library/HTTPStorages/com.darioielardi.delta",
    "~/Library/Preferences/com.darioielardi.delta.plist",
    "~/Library/Saved Application State/com.darioielardi.delta.savedState",
    "~/Library/WebKit/com.darioielardi.delta",
  ]
end
