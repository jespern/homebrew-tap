class Marlin < Formula
  desc "Fast, simple AI agent harness with durable, multiplexed sessions"
  homepage "https://marlin.wtf"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jespern/marlin/releases/download/v#{version}/marlin-aarch64-darwin.tar.gz"
      sha256 "de74d73784b4f2b285cfa4296048c57d0404d98291e158ab6e2460c3e93a4c69"
    end

    on_intel do
      url "https://github.com/jespern/marlin/releases/download/v#{version}/marlin-x86_64-darwin.tar.gz"
      sha256 "16ab18bb933557f94aeadbd6d94d6e521ccb7d75e02424c53b08dc777c177824"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jespern/marlin/releases/download/v#{version}/marlin-aarch64-linux.tar.gz"
      sha256 "0b16508beda6d948f4ae6d161c9fc58ca3b64b3478c5a4d70bd0927f7c5025a6"
    end

    on_intel do
      url "https://github.com/jespern/marlin/releases/download/v#{version}/marlin-x86_64-linux.tar.gz"
      sha256 "50833ca24b64efcb9175a07aa4a16b839221b4212a992b97cd8e378ece3f885a"
    end
  end

  def install
    bin.install "marlin"
    doc.install "LICENSE", "NOTICE", "THIRD_PARTY_NOTICES"
  end

  test do
    assert_equal "marlin #{version}", shell_output("#{bin}/marlin version").strip
    assert_match "fast, simple AI agent harness", shell_output("#{bin}/marlin help")
  end
end
