class Marlin < Formula
  desc "Fast, simple AI agent harness with durable, multiplexed sessions"
  homepage "https://marlin.wtf"
  version "0.1.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jespern/marlin/releases/download/v#{version}/marlin-aarch64-darwin.tar.gz"
      sha256 "05be7b53682ad24f1d0958eb29553086ef6de278cd0056b7a6dd6810f3e5e033"
    end

    on_intel do
      url "https://github.com/jespern/marlin/releases/download/v#{version}/marlin-x86_64-darwin.tar.gz"
      sha256 "5fa8446fc542601588aeab1448c07bea379848bbd62763848f716d479e9cdc8b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jespern/marlin/releases/download/v#{version}/marlin-aarch64-linux.tar.gz"
      sha256 "e2ee6c5d1cdcc64a4c882e6df5cb9bd796e47a093e75392952d57c2fdc0e5f17"
    end

    on_intel do
      url "https://github.com/jespern/marlin/releases/download/v#{version}/marlin-x86_64-linux.tar.gz"
      sha256 "e8c246a46ee093028d720801a548d3bbac9f30ba639c40b06300b7adb6fe89b2"
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
