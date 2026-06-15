class Coremetrics < Formula
  desc "Cross-platform desktop system metrics monitor (CPU, RAM, GPU, processes)"
  homepage "https://github.com/sviatil0/coremetrics"
  license "LGPL-2.1-only"
  version "0.2.18"

  on_macos do
    on_arm do
      url "https://github.com/sviatil0/coremetrics/releases/download/v0.2.18/coremetrics-v0.2.18-macos-arm64.tar.gz"
      sha256 "e5bef74893d0e02a5e8352cc5f7aa117b3cfc3ca1466685628c1303f0ab68b62"
    end
  end

  on_linux do
    url "https://github.com/sviatil0/coremetrics/releases/download/v0.2.18/coremetrics-v0.2.18-linux-x86_64.tar.gz"
    sha256 "28fad3755954d0d921da315429c073c8a28fcb3d12dbad5c435df4f38b80b621"
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
