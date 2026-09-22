class Marlin < Formula
  desc "Fast, simple AI agent harness with durable, multiplexed sessions"
  homepage "https://marlin.wtf"
  version "0.1.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jespern/marlin/releases/download/v#{version}/marlin-aarch64-darwin.tar.gz"
      sha256 "31c77d312ffb631a18d20f1c2ac7fddfe0d8cae4307bc7b7ca4c5067593ae738"
    end

    on_intel do
      url "https://github.com/jespern/marlin/releases/download/v#{version}/marlin-x86_64-darwin.tar.gz"
      sha256 "e17909d8703b439c8a97cedd9b71d6d9a0e29fb34bb0f3fa437bb999bbeb1b33"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jespern/marlin/releases/download/v#{version}/marlin-aarch64-linux.tar.gz"
      sha256 "451fc682a207c041422acdc928412fd404f80830b697db791bd12a02419286a5"
    end

    on_intel do
      url "https://github.com/jespern/marlin/releases/download/v#{version}/marlin-x86_64-linux.tar.gz"
      sha256 "ce51ce076d0799ab53456fd0dc38e2fffc9fef738d1168a568785f56e942403f"
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
