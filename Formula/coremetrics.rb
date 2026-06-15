class Coremetrics < Formula
  desc "Cross-platform desktop system metrics monitor (CPU, RAM, GPU, processes)"
  homepage "https://github.com/sviatil0/coremetrics"
  license "LGPL-2.1-only"
  version "0.2.16"

  on_macos do
    on_arm do
      url "https://github.com/sviatil0/coremetrics/releases/download/v0.2.16/coremetrics-v0.2.16-macos-arm64.tar.gz"
      sha256 "1799c655b57d3ee0dfd119c1bd82e79b3cd1ed5cfcdb67f224f55c6b33623e04"
    end
  end

  on_linux do
    url "https://github.com/sviatil0/coremetrics/releases/download/v0.2.16/coremetrics-v0.2.16-linux-x86_64.tar.gz"
    sha256 "86fa4d7dc7ca18f96000188e891242097510cf3b5edd22e99d872beb16f8bb9e"
  end

  depends_on "sdl3"
  depends_on "sdl3_ttf"
  depends_on "sdl3_image"

  def install
    bin.install "coremetrics"
    pkgshare.install "assets"
    pkgshare.install "base.xml" if File.exist?("base.xml")
    doc.install "README.md" if File.exist?("README.md")
    doc.install "CONTRIBUTING.md" if File.exist?("CONTRIBUTING.md")
    doc.install "INSTALL.txt" if File.exist?("INSTALL.txt")
  end

  test do
    system bin/"coremetrics", "--duration", "1"
  end
end
