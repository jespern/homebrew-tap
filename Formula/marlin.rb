class Marlin < Formula
  desc "Fast, simple AI agent harness with durable, multiplexed sessions"
  homepage "https://marlin.wtf"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jespern/marlin/releases/download/v#{version}/marlin-aarch64-darwin.tar.gz"
      sha256 "2292838178aaea6893c51ef913d7a89c887b744a13853a5214d1d319b81c7e85"
    end

    on_intel do
      url "https://github.com/jespern/marlin/releases/download/v#{version}/marlin-x86_64-darwin.tar.gz"
      sha256 "7682f0cebadf868d37c3ea33d3270c2a39945adfa06915c373d2e3bfd7e924e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jespern/marlin/releases/download/v#{version}/marlin-aarch64-linux.tar.gz"
      sha256 "df5a838cb150a1a4847a0d3e393c5ab10f1d8f35d679a67028b8cb3e1a58b5c5"
    end

    on_intel do
      url "https://github.com/jespern/marlin/releases/download/v#{version}/marlin-x86_64-linux.tar.gz"
      sha256 "21c8ecb5a276724b3dc0855c9680e2682b2c40cb3bf32444167199ba877b6c3a"
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
