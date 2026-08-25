class Marlin < Formula
  desc "Fast, simple AI agent harness with durable, multiplexed sessions"
  homepage "https://marlin.wtf"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jespern/marlin/releases/download/v#{version}/marlin-aarch64-darwin.tar.gz"
      sha256 "001b8c481f08cdbd3b11d11f27cda63cda5eef7aa32c31648797370c7346a338"
    end

    on_intel do
      url "https://github.com/jespern/marlin/releases/download/v#{version}/marlin-x86_64-darwin.tar.gz"
      sha256 "da664a62a5bbd3ff666a3746414ff397d18b6a63f08f3e8c8d5e77bf0f56e1af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jespern/marlin/releases/download/v#{version}/marlin-aarch64-linux.tar.gz"
      sha256 "a428b5ba405b106a15ccc5d8538b016791363b7d9c0b20ae26dfe99379471396"
    end

    on_intel do
      url "https://github.com/jespern/marlin/releases/download/v#{version}/marlin-x86_64-linux.tar.gz"
      sha256 "1cfbf2fe7c769442dcaa33cb6605ddcc8ba65b1d55307e21ba6bea436744c469"
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
