class Coremetrics < Formula
  desc "Cross-platform desktop system metrics monitor (CPU, RAM, GPU, processes)"
  homepage "https://github.com/sviatil0/coremetrics"
  license "LGPL-2.1-only"
  version "0.2.7"

  on_macos do
    on_arm do
      url "https://github.com/sviatil0/coremetrics/releases/download/v0.2.7/coremetrics-v0.2.7-macos-arm64.tar.gz"
      sha256 "d89772bb8d6213b48433fea466fd8e0a7f8625bb5f70656bb197ab3777f3deac"
    end
  end

  on_linux do
    url "https://github.com/sviatil0/coremetrics/releases/download/v0.2.7/coremetrics-v0.2.7-linux-x86_64.tar.gz"
    sha256 "49b34e10c5db51bb0c3112b641ca236128c575ea2b7df1048458a80c4ed19a94"
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
